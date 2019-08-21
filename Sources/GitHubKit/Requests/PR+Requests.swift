import NIO


extension PR: Queryable { }


extension QueryableProperty where QueryableType == PR {
    
    /// Get pull requests
    public func get(org: String, repo: String) throws -> EventLoopFuture<[PR]> {
        return try github.get(path: "repos/\(org)/\(repo)/pulls")
    }
    
}
