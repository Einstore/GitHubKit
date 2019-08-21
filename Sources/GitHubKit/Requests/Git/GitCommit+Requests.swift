import NIO


extension GitCommit: Queryable { }


extension QueryableProperty where QueryableType == GitCommit {
    
    
    /// Get specific git commit
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    /// - Parameter sha: SHA of the commit
    public func get(org: String, repo: String, sha: String) throws -> EventLoopFuture<GitCommit> {
        return try github.get(path: "repos/\(org)/\(repo)/git/commits/\(sha)")
    }
    
}
