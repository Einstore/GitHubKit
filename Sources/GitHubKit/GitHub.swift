import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient


/// Main GitHub service class
public class GitHub: GitHubClient {
    
    public enum Error: Swift.Error {
        
        case notFound(String)
        
        case invalidContent
        
        case missingRediretHeaders
        
    }
    
    /// Main configuration
    public struct Config {
        
        /// GitHub username associated with a personal access token
        public let username: String
        
        /// Personal access token
        public let token: String
        
        /// Server URL
        public let server: GitHubServerConvertible
        
        /// Initializer
        public init(username: String, token: String, server: GitHubServerConvertible = GitHubServer.github) {
            self.username = username
            self.token = token
            self.server = server
        }
        
    }
    
    /// Format of an archive
    public enum Format: String {
        case tarball
        case zipball
    }
    
    /// Copy of the given configuration
    public let config: Config
    
    let client: AsyncHTTPClient.HTTPClient
    
    /// Initializer
    public init(_ config: Config, eventLoopGroupProvider provider: AsyncHTTPClient.HTTPClient.EventLoopGroupProvider = .createNew, proxy: AsyncHTTPClient.HTTPClient.Configuration.Proxy? = nil) throws {
        self.config = config
        var conf = AsyncHTTPClient.HTTPClient.Configuration()
        conf.proxy = proxy
        self.client = AsyncHTTPClient.HTTPClient(
            eventLoopGroupProvider: provider,
            configuration: conf
        )
    }
    
    /// Initializer
    public init(_ config: Config, eventLoop: EventLoop) throws {
        self.config = config
        self.client = AsyncHTTPClient.HTTPClient(eventLoopGroupProvider: .shared(eventLoop))
    }
    
    var eventLoop: EventLoop {
        return client.eventLoopGroup.next()
    }
    
    public func syncShutdown() throws {
        try client.syncShutdown()
    }
    
}


extension AsyncHTTPClient.HTTPClient.Response {
    
    mutating func data() -> Data? {
        guard var byteBuffer = body else {
            return nil
        }
        guard let data = byteBuffer.readBytes(length: byteBuffer.readableBytes) else {
            return nil
        }
        return Data(data)
    }
    
}


extension GitHub {
    
    fileprivate func req(_ method: HTTPMethod, _ path: String, _ body: AsyncHTTPClient.HTTPClient.Body? = nil) throws -> AsyncHTTPClient.HTTPClient.Request {
        let url = config.url(for: path)
        let req = try AsyncHTTPClient.HTTPClient.Request(
            url: url,
            method: method,
            headers: headers,
            body: body
        )
        return req
    }
    
    /// Retrieve data from GitHub API and turn them into a model
    public func get<C>(path: String) throws -> EventLoopFuture<C> where C: Decodable {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            var response = response
            guard response.status == .ok else {
                var r = response
                if let data = r.body?.readString(length: response.body!.readableBytes) {
                    print(data)
                }
                return self.eventLoop.makeFailedFuture(Error.notFound(path))
            }
            do {
                guard let data = response.data() else {
                    return self.eventLoop.makeFailedFuture(Error.invalidContent)
                }
                let decoded = try JSONDecoder().decode(C.self, from: data)
                return self.eventLoop.makeSucceededFuture(decoded)
            } catch {
                return self.eventLoop.makeFailedFuture(error)
            }
        }
    }
    
    /// Post
    public func post<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        return try send(method: .POST, path: path, post: post)
    }
    
    /// Put
    public func put<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        return try send(method: .PUT, path: path, post: post)
    }
    
    /// Patch
    public func patch<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        return try send(method: .PATCH, path: path, post: post)
    }
    
    /// Delete
    public func delete(path: String) throws -> EventLoopFuture<Void> {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            guard response.status == .ok || response.status == .noContent else {
                return self.eventLoop.makeFailedFuture(Error.notFound(path))
            }
            return self.eventLoop.makeSucceededFuture(Void())
        }
    }
    
    /// Retrieve a file
    public func get(file path: String) throws -> EventLoopFuture<Data?> {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            var response = response
            guard response.status == .ok || response.status == .noContent else {
                return self.eventLoop.makeFailedFuture(Error.notFound(path))
            }
            return self.eventLoop.makeSucceededFuture(response.data())
        }
    }
    
    /// Get a redirect link
    public func redirect(file path: String, status: HTTPResponseStatus = .found) throws -> EventLoopFuture<String> {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            guard response.status == status else {
                return self.eventLoop.makeFailedFuture(Error.notFound(path))
            }
            guard response.headers.contains(name: "Location"), let redirect = response.headers["Location"].first else {
                return self.eventLoop.makeFailedFuture(Error.missingRediretHeaders)
            }
            return self.eventLoop.makeSucceededFuture(redirect)
        }
    }
    
    /// Get a temporary download link for an archive
    public func download(org: String, repo: String, ref: String, format: Format = .tarball) throws -> EventLoopFuture<String> {
        return try redirect(file: "repos/\(org)/\(repo)/\(format.rawValue)/\(ref)", status: .found)
    }
    
}


extension GitHub {
    
    /// Auth headers for request
    private var headers: HTTPHeaders {
        let loginString = "\(config.username):\(config.token)"
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let headers: HTTPHeaders = [
            "Authorization": "Basic \(base64LoginString)",
            "User-Agent": "GitHubKit(https://github.com/Einstore/GitHubKit)"
        ]
        return headers
    }
    
    /// Send a request
    private func send<C, E>(method: HTTPMethod, path: String, post: E? = nil) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        let body: AsyncHTTPClient.HTTPClient.Body?
        if let post = post {
            let jsonData = try JSONEncoder().encode(post)
            body = .data(jsonData)
        } else {
            body = nil
        }
        
        let r = try req(method, path, body)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            var response = response
            guard response.status == .ok || response.status == .created else {
                if let data = response.data() {
                    print("Error data: " + (String(data: data, encoding: .utf8) ?? "No error data to print"))
                }
                return self.eventLoop.makeFailedFuture(Error.notFound(path))
            }
            if response.body?.capacity == 0 {
                return self.eventLoop.makeSucceededFuture(nil)
            }
            do {
                guard let data = response.data() else {
                    return self.eventLoop.makeFailedFuture(Error.invalidContent)
                }
                let decoded = try JSONDecoder().decode(C.self, from: data)
                return self.eventLoop.makeSucceededFuture(decoded)
            } catch {
                return self.eventLoop.makeFailedFuture(error)
            }
        }
    }
    
}


extension String: GitHubServerConvertible {
    
    /// Self value of a string
    public var value: String {
        return self
    }
    
}


extension GitHub.Config {
    
    /// Build URL from a path
    func url(for path: String) -> String {
        return server.value
            .trimmingCharacters(in: .init(charactersIn: "/"))
            .appending("/")
            .appending(path)
    }
    
}
