//
//  File.swift
//  
//
//  Created by Ondrej Rafaj on 22/06/2019.
//

import NIO


extension Commit: Queryable { }


extension QueryableProperty where QueryableType == Commit {
    
    /// Get commits
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<[Commit]> {
        return try github.get(path: "repos/\(org)/\(repo)/commits")
    }
    
    /// Get commit detail
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<Commit> {
        return try github.get(path: "repos/\(org)/\(repo)/commits/\(sha)")
    }
    
    /// Get branches where commit is HEAD
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<[Branch]> {
        return try github.get(path: "repos/\(org)/\(repo)/commits/\(sha)/branches-where-head")
    }
    
}

