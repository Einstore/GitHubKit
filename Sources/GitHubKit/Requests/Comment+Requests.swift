//
//  File.swift
//  
//
//  Created by Ondrej Rafaj on 13/06/2019.
//

import NIO


extension Comment: Queryable { }


extension QueryableProperty where QueryableType == Comment {
    
    /// Get comments for an issue
    public func get(org: String, repo: String, issue: Int) throws -> EventLoopFuture<[Comment]> {
        return try github.get(path: "repos/\(org)/\(repo)/issues/\(issue)/comments")
    }
    
    /// Get comments for a PR
    public func get(org: String, repo: String, pr: Int) throws -> EventLoopFuture<[Comment]> {
        return try get(org: org, repo: repo, issue: pr)
    }
    
    /// All comments for a repo
    public func get(org: String, repo: String) throws -> EventLoopFuture<[Comment]> {
        return try github.get(path: "repos/\(org)/\(repo)/issues/comments")
    }
    
    /// Get a single comment
    public func get(org: String, repo: String, comment: Int) throws -> EventLoopFuture<Comment> {
        return try github.get(path: "repos/\(org)/\(repo)/issues/comments/\(comment)")
    }
    
    /// Post a new comment to an issue
    public func create(org: String, repo: String, issue: Int, message: String) throws -> EventLoopFuture<Comment?> {
        let message = Comment.Post(body: message)
        return try github.post(path: "repos/\(org)/\(repo)/issues/\(issue)/comments", post: message)
    }
    
    /// Post a new comment to a PR
    public func create(org: String, repo: String, pr: Int, message: String) throws -> EventLoopFuture<Comment?> {
        return try create(org: org, repo: repo, issue: pr, message: message)
    }
    
    /// Update an existing comment
    public func update(org: String, repo: String, comment: Int, message: String) throws -> EventLoopFuture<Comment?> {
        let message = Comment.Post(body: message)
        return try github.patch(path: "repos/\(org)/\(repo)/issues/comments/\(comment)", post: message)
    }
    
    /// Delete an existing comment
    public func delete(org: String, repo: String, comment: Int) throws -> EventLoopFuture<Void> {
        return try github.delete(path: "repos/\(org)/\(repo)/issues/comments/\(comment)")
    }
    
}
