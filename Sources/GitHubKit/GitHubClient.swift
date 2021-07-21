import Foundation
import NIOHTTP1


public protocol GitHubClient {
    
    func syncShutdown() throws
    func get<C>(path: String) throws -> EventLoopFuture<C> where C: Decodable
    func post<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable
    func put<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable
    func patch<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable
    func delete(path: String) throws -> EventLoopFuture<Void>
    func delete<C, E>(path: String, post: E) throws -> EventLoopFuture<C?> where C: Decodable, E: Encodable
    func get(file path: String) throws -> EventLoopFuture<Data?>
    func redirect(file path: String, status: HTTPResponseStatus) throws -> EventLoopFuture<String>
    func download(org: String, repo: String, ref: String, format: GitHub.Format) throws -> EventLoopFuture<String>
    
}
