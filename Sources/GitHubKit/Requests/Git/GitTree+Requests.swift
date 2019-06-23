//
//  GitTree+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import NIO


extension GitTree: Queryable { }


extension QueryableProperty where QueryableType == GitTree {
    
    
    /// Get specific git tree
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    /// - Parameter sha: SHA of the tree
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<GitTree> {
        return try github.get(path: "repos/\(org)/\(repo)/git/trees/\(sha)")
    }
    
}
