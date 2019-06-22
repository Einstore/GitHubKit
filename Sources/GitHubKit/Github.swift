//
//  Github.swift
//  
//
//  Created by Ondrej Rafaj on 10/06/2019.
//

import Foundation
import NIO
import NIOHTTP1
import NIOHTTPClient


/// Server value convertible
public protocol GithubServerConvertible {
    var value: String { get }
}

/// Predefined github server values
public enum GithubServer: GithubServerConvertible {
    
    /// api.github.com
    case github
    
    /// Enterprise Github
    case enterprise(String)
    
    /// Server URL
    public var value: String {
        switch self {
        case .github:
            return "https://api.github.com"
        case .enterprise(let url):
            return url
        }
    }
}

/// Main Github service class
public class Github {
    
    public enum Error: Swift.Error {
        
        case fileNotFound(String)
        
        case invalidContent
        
    }
    
    /// Main configuration
    public struct Config {
        
        /// Github username associated with a personal access token
        public let username: String
        
        /// Personal access token
        public let token: String
        
        /// Server URL
        public let server: GithubServerConvertible
        
        /// Initializer
        public init(username: String, token: String, server: GithubServerConvertible = GithubServer.github) {
            self.username = username
            self.token = token
            self.server = server
        }
        
    }
    
    /// Copy of the given configuration
    public let config: Config
    
    let client: HTTPClient
    
    /// Initializer
    public init(_ config: Config, eventLoopGroupProvider provider: EventLoopGroupProvider = .createNew) throws {
        self.config = config
        self.client = HTTPClient(eventLoopGroupProvider: provider)
    }
    
    /// Initializer
    public init(_ config: Config, eventLoop: EventLoop) throws {
        self.config = config
        self.client = HTTPClient(eventLoopGroupProvider: .shared(eventLoop))
    }
    
    var eventLoop: EventLoop {
        return client.eventLoopGroup.next()
    }
    
    public func syncShutdown() throws {
        try client.syncShutdown()
    }
    
}


extension HTTPClient.Response {
    
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


extension Github {
    
    fileprivate func req(_ method: HTTPMethod, _ path: String, _ body: HTTPClient.Body? = nil) throws -> HTTPClient.Request {
        let url = config.url(for: path)
        let req = try HTTPClient.Request(
            url: url,
            method: method,
            headers: headers,
            body: body
        )
        return req
    }
    
    /// Retrieve data from Github API and turn them into a model
    func get<C>(path: String) throws -> EventLoopFuture<C> where C: Decodable {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            var response = response
            guard response.status == .ok else {
                return self.eventLoop.makeFailedFuture(Error.fileNotFound(path))
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
    func post<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        return try send(method: .POST, path: path, post: post)
    }
    
    /// Put
    func put<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        return try send(method: .PUT, path: path, post: post)
    }
    
    /// Patch
    func patch<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        return try send(method: .PATCH, path: path, post: post)
    }
    
    /// Delete
    func delete(path: String) throws -> EventLoopFuture<Void> {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            guard response.status == .ok || response.status == .noContent else {
                return self.eventLoop.makeFailedFuture(Error.fileNotFound(path))
            }
            return self.eventLoop.makeSucceededFuture(Void())
        }
    }
    
    /// Retrieve a file
    func get(file path: String) throws -> EventLoopFuture<Data?> {
        let r = try req(.GET, path)
        let future = client.execute(request: r)
        return future.flatMap() { response in
            var response = response
            guard response.status == .ok || response.status == .noContent else {
                return self.eventLoop.makeFailedFuture(Error.fileNotFound(path))
            }
            return self.eventLoop.makeSucceededFuture(response.data())
        }
    }
    
}


extension Github {
    
    /// Auth headers for request
    fileprivate var headers: HTTPHeaders {
        let loginString = "\(config.username):\(config.token)"
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let headers: HTTPHeaders = [
            "Authorization": "Basic \(base64LoginString)"
        ]
        return headers
    }
    
    /// Send a request
    fileprivate func send<C, E>(method: HTTPMethod, path: String, post: E? = nil) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable {
        let body: HTTPClient.Body?
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
                return self.eventLoop.makeFailedFuture(Error.fileNotFound(path))
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


extension String: GithubServerConvertible {
    
    /// Self value of a string
    public var value: String {
        return self
    }
    
}


extension Github.Config {
    
    /// Build URL from a path
    func url(for path: String) -> String {
        return server.value
            .trimmingCharacters(in: .init(charactersIn: "/"))
            .appending("/")
            .appending(path).lowercased()
    }
    
}
