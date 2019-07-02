//
//  Webhook+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 20/06/2019.
//

import NIO


extension Webhook: Queryable { }


extension QueryableProperty where QueryableType == Webhook {
    
    /// Get specific webhook
    public func get(org: String, repo: String, hook id: Int) throws -> EventLoopFuture<Webhook> {
        return try github.get(path: "repos/\(org)/\(repo)/hooks/\(id)")
    }
    
    /// Test a specific webhook
    public func test(org: String, repo: String, hook id: Int) throws -> EventLoopFuture<Void> {
        let future: EventLoopFuture<Webhook?> = try github.post(path: "repos/\(org)/\(repo)/hooks/\(id)/tests", post: [] as [String])
        return future.map { _ in
            return Void()
        }
    }
    
    /// Create a webhook
    public func create(org: String, repo: String, hook: Webhook.Post) throws -> EventLoopFuture<Webhook?> {
        let future: EventLoopFuture<Webhook?> = try github.post(path: "repos/\(org)/\(repo)/hooks", post: hook)
        return future
    }
    
    /// Edit a specific webhook
    public func edit(org: String, repo: String, id: Int, hook: Webhook.Post) throws -> EventLoopFuture<Webhook?> {
        let future: EventLoopFuture<Webhook?> = try github.patch(path: "repos/\(org)/\(repo)/hooks/\(id)", post: hook)
        return future
    }
    
    /// Get all available webhooks
    public func get(org: String, repo: String) throws -> EventLoopFuture<[Webhook]> {
        return try github.get(path: "repos/\(org)/\(repo)/hooks")
    }
    
}

