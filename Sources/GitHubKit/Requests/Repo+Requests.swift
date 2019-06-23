//
//  Repo+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 11/06/2019.
//

import NIO


extension Repo: Queryable { }


extension QueryableProperty where QueryableType == Repo {
    
    /// Get organization detail
    public func get(org: String, repo: String) throws -> EventLoopFuture<Repo> {
        return try github.get(path: "repos/\(org)/\(repo)")
    }
    
    /// Get all repos for a user
    public func get(user: String) throws -> EventLoopFuture<[Repo]> {
        return try github.get(path: "users/\(user)/repos")
    }
    
    /// Get all repos for an organization
    public func get(org: String) throws -> EventLoopFuture<[Repo]> {
        return try github.get(path: "orgs/\(org)/repos")
    }
    
    /// Get all organizations for authenticated user
    public func get() throws -> EventLoopFuture<[Repo]> {
        return try github.get(path: "user/repos")
    }
    
}
