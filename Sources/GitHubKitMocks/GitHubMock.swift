import GitHubKit
import NIOHTTP1
import NIO


public protocol MockResponseConvertible {
    var mockResponse: GitHubMock.MockResponse { get }
}


public class GitHubMock: GitHubClient {
    
    public struct MockResponse: MockResponseConvertible, Hashable {
        
        public let method: HTTPMethod
        public let path: String
        
        public init(_ method: HTTPMethod = .GET, _ path: String) {
            self.method = method
            self.path = path
        }
        
        public var mockResponse: MockResponse {
            return self
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(path)
            hasher.combine(method.rawValue)
        }
        
    }
    
    public var eventLoop = EmbeddedEventLoop()

    public var responses: [MockResponse: Decodable?] = [:]
    
    public func add<C>(response object: C? = nil, path: String, method: HTTPMethod = .GET) where C: Decodable {
        responses[MockResponse(method, path)] = object
    }
        
    func response<C>(_ method: HTTPMethod, _ path: String) -> C? where C: Decodable {
        let key = MockResponse(method, path)
        let ret = responses[key]
        print(C.self)
        return ret as? C
    }
    
    func future<C>(response method: HTTPMethod, _ path: String) -> EventLoopFuture<C> where C: Decodable {
        let r: C? = response(.GET, path)
        guard let d: C = r else {
            return eventLoop.makeFailedFuture(GitHub.Error.notFound(path))
        }
        return eventLoop.makeSucceededFuture(d)
    }
    
    public func get<C>(path: String) throws -> EventLoopFuture<C> where C : Decodable {
        return future(response: .GET, path)
    }
    
    public func post<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C : Decodable, E : Encodable {
        return future(response: .POST, path)
    }
    
    public func put<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C : Decodable, E : Encodable {
        return future(response: .PUT, path)
    }
    
    public func patch<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C : Decodable, E : Encodable {
        return future(response: .PATCH, path)
    }
    
    public func delete(path: String) throws -> EventLoopFuture<Void> {
        guard let _ = responses.index(forKey: GitHubMock.MockResponse(.DELETE, path)) else {
            return eventLoop.makeFailedFuture(GitHub.Error.notFound(path))
        }
        return eventLoop.makeSucceededFuture(Void())
    }
    
    public var files: [String: Data] = [:]
    
    public func get(file path: String) throws -> EventLoopFuture<Data?> {
        guard let file = files[path] else {
            return eventLoop.makeSucceededFuture(nil)
        }
        return eventLoop.makeSucceededFuture(file)
    }
    
    public var redirects: [String: String] = [:]
    
    public func redirect(file path: String, status: HTTPResponseStatus = .found) throws -> EventLoopFuture<String> {
        guard let redirect = redirects[path] else {
            return eventLoop.makeFailedFuture(GitHub.Error.notFound(path))
        }
        return eventLoop.makeSucceededFuture(redirect)
    }
    
    /// Download links
    ///    - Note: Repo is a key to return a download link
    public var downloads: [String: String] = [:]
    
    public func download(org: String, repo: String, ref: String, format: GitHub.Format = .tarball) throws -> EventLoopFuture<String> {
        guard let download = downloads[repo] else {
            return eventLoop.makeFailedFuture(GitHub.Error.notFound("Download for \(org)/\(repo)/\(ref)"))
        }
        return eventLoop.makeSucceededFuture(download)
    }
    
    public func syncShutdown() throws { }
    
    public init() { }
    
}


extension String: MockResponseConvertible {
    
    public var mockResponse: GitHubMock.MockResponse {
        return GitHubMock.MockResponse(.GET, self)
    }
    
}
