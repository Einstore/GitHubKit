//
//  FRepo+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 11/06/2019.
//

import Vapor


extension Repo: Queryable { }


extension QueryableProperty where QueryableType == Repo {
    
    /// Get organization detail
    public func get(organization org: String, repo: String) throws -> EventLoopFuture<Repo> {
        return try github.get(path: "/repos/\(org.lowercased())/\(repo.lowercased())")
    }
    
    /// Get all repos for a user
    public func get(user: String) throws -> EventLoopFuture<[Repo]> {
        return try github.get(path: "/users/\(user.lowercased())/repos")
    }
    
    /// Get all repos for an organization
    public func get(organization org: String) throws -> EventLoopFuture<[Repo]> {
        return try github.get(path: "/orgs/\(org.lowercased())/repos")
    }
    
    /// Get all organizations for authenticated user
    public func getAll() throws -> EventLoopFuture<[Repo]> {
        return try github.get(path: "user/repos")
    }
    
}
