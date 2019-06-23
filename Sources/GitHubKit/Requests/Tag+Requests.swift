//
//  Tag+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import NIO


extension Tag: Queryable { }


extension QueryableProperty where QueryableType == Tag {
    
    /// Get a tag
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    /// - Parameter sha: SHA of the tag
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<Tag> {
        return try github.get(path: "repos/\(org)/\(repo)/git/tags/\(sha)")
    }
    
}
