//
//  File+Requests.swift
//  
//
//  Created by Ondrej Rafaj on 11/06/2019.
//

import NIO


extension File: Queryable { }


extension QueryableProperty where QueryableType == File {
    
    /// Get file detail
    public func get(org: String, repo: String, ref: String? = nil, path: String) throws -> EventLoopFuture<File> {
        var path = "repos/\(org)/\(repo)/contents/\(path)"
        if let ref = ref {
            path.append("?ref=\(ref)")
        }
        return try github.get(path: path)
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
