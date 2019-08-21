import NIO


extension GitBlob: Queryable { }


extension QueryableProperty where QueryableType == GitBlob {
    
    
    /// Get specific git file (blob)
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    /// - Parameter sha: SHA of the file
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<GitBlob> {
        return try github.get(path: "repos/\(org)/\(repo)/git/blobs/\(sha)")
    }
    
}
