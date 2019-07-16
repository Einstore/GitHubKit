//
//  PR+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 16/07/2019.
//

import NIO


extension PR: Queryable { }


extension QueryableProperty where QueryableType == PR {
    
    /// Get pull requests
    public func get(org: String, repo: String) throws -> EventLoopFuture<[PR]> {
        return try github.get(path: "repos/\(org)/\(repo)/pulls")
    }
    
}
