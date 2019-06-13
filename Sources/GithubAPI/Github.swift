//
//  Github.swift
//  
//
//  Created by Ondrej Rafaj on 10/06/2019.
//

import Vapor


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
    
    let client: Client
    
    let container: Container
    
    /// Initializer
    public init(_ config: Config, on c: Container) throws {
        self.config = config
        self.client = try c.make()
        self.container = c
    }
    
}


extension Github {
    
    var headers: HTTPHeaders {
        let loginString = "\(config.username):\(config.token)"
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic \(base64LoginString)"
        ]
        return headers
    }
    
    /// Retrieve data from Github API and turn them into a model
    func get<C>(path: String) throws -> EventLoopFuture<C> where C: Decodable {
        let uri = URI(string: config.url(for: path))
        
        let clientRequest = ClientRequest(
            method: .GET,
            url: uri,
            headers: headers,
            body: nil
        )
        
        return client.send(clientRequest).flatMap() { response in
            guard response.status == .ok else {
                return self.container.eventLoop.makeFailedFuture(Error.fileNotFound(path))
            }
            do {
                let data = try response.content.decode(C.self)
                return self.container.eventLoop.makeSucceededFuture(data)
            } catch {
                return self.container.eventLoop.makeFailedFuture(error)
            }
        }
    }
    
    func get(file url: String) throws -> EventLoopFuture<Data?> {
        let uri = URI(string: url)
        
        let clientRequest = ClientRequest(
            method: .GET,
            url: uri,
            headers: headers,
            body: nil
        )
        
        return client.send(clientRequest).map() { response in
            return response.body?.getData(at: 0, length: (response.body?.capacity ?? 0))
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
    
    func url(for path: String) -> String {
        return server.value.finished(with: "/").appending(path)
    }
    
}
