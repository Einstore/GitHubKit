//
//  Release+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import NIO


extension Release: Queryable { }


extension QueryableProperty where QueryableType == Release {
    
    /// Get a release
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    /// - Parameter id: Release ID
    public func get(org: String, repo: String, id: String) throws -> EventLoopFuture<Release> {
        return try github.get(path: "repos/\(org)/\(repo)/releases/\(id)")
    }
    
    /// Get the latest release
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    public func latest(org: String, repo: String) throws -> EventLoopFuture<Release> {
        return try github.get(path: "repos/\(org)/\(repo)/releases/latest")
    }
    
}

