//
//  File+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 11/06/2019.
//

import Foundation
import NIO


extension File: Queryable { }


extension QueryableProperty where QueryableType == File {
    
    /// Get file detail
    public func get(organization org: String, repo: String, path: String) throws -> EventLoopFuture<File> {
        return try github.get(path: "repos/\(org.lowercased())/\(repo.lowercased())/contents/\(path)")
    }
    
}


extension EventLoopFuture where Value == File {
    
    /// Download file content if available
    public func download(on github: Github) throws -> EventLoopFuture<Data> {
        return flatMap { file in
            guard file.type == "file" else {
                return github.eventLoop.makeFailedFuture(File.Error.notFile(file.type))
            }
            if let base64Content = file.content, let data = Data(base64Encoded: base64Content, options: [.ignoreUnknownCharacters]) {
                return github.eventLoop.makeSucceededFuture(data)
            }
            guard let downloadUrl = file.downloadURL else {
                return github.eventLoop.makeFailedFuture(File.Error.missingDownloadUrl)
            }
            do {
                return try github.get(file: downloadUrl).flatMapThrowing({ data in
                    guard let data = data else {
                        throw File.Error.missingDownloadUrl
                    }
                    return data
                })
            } catch {
                return github.eventLoop.makeFailedFuture(error)
            }
        }
    }
    
}
