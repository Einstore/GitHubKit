//
//  File+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 11/06/2019.
//

import Vapor


extension File: Queryable { }


extension QueryableProperty where QueryableType == File {
    
    /// Get file detail
    public func get(organization org: String, repo: String, path: String) throws -> EventLoopFuture<File> {
        return try github.get(path: "repos/\(org.lowercased())/\(repo.lowercased())/contents/\(path)")
    }
    
}


extension EventLoopFuture where Value == File {
    
    /// Download file content if available
    public func download(on c: Container) throws -> EventLoopFuture<Data> {
        return flatMap { file in
            guard file.type == "file" else {
                return c.eventLoop.makeFailedFuture(File.Error.notFile(file.type))
            }
            guard let downloadUrl = file.downloadURL else {
                return c.eventLoop.makeFailedFuture(File.Error.missingDownloadUrl)
            }
            do {
                let github = try c.make(Github.self)
                return try github.get(file: downloadUrl).flatMapThrowing({ data in
                    guard let data = data else {
                        throw File.Error.missingDownloadUrl
                    }
                    return data
                })
            } catch {
                return c.eventLoop.makeFailedFuture(error)
            }
        }
    }
    
}
