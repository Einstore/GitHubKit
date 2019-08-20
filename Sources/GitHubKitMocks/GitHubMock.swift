import GitHubKit
import NIOHTTP1


public class GitHubMock: GitHubClient {
    
    public func get<C>(path: String) throws -> EventLoopFuture<C> where C : Decodable {
        fatalError()
    }
    
    public func post<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C : Decodable, E : Encodable {
        fatalError()
    }
    
    public func put<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C : Decodable, E : Encodable {
        fatalError()
    }
    
    public func patch<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C : Decodable, E : Encodable {
        fatalError()
    }
    
    public func delete(path: String) throws -> EventLoopFuture<Void> {
        fatalError()
    }
    
    public func get(file path: String) throws -> EventLoopFuture<Data?> {
        fatalError()
    }
    
    public func redirect(file path: String, status: HTTPResponseStatus = .found) throws -> EventLoopFuture<String> {
        fatalError()
    }
    
    public func download(org: String, repo: String, ref: String, format: GitHub.Format = .tarball) throws -> EventLoopFuture<String> {
        fatalError()
    }
    
    public func syncShutdown() throws { }
    
}
