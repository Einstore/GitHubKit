//
//  Organization+Request.swift
//  
//
//  Created by Ondrej Rafaj on 10/06/2019.
//

import Vapor


extension Organization: Queryable { }


extension QueryableProperty where QueryableType == Organization {
    
    /// Get organization detail
    public func get(organization name: String) throws -> EventLoopFuture<Organization> {
        return try github.get(path: "orgs/\(name.lowercased())")
    }
    
    /// Get all organizations for a user
    public func get(user: String) throws -> EventLoopFuture<[Organization]> {
        return try github.get(path: "users/\(user)/orgs")
    }
    
    /// Get all organizations for authenticated user
    public func getAll() throws -> EventLoopFuture<[Organization]> {
        return try github.get(path: "user/orgs")
    }
    
}
