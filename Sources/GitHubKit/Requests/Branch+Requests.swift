import NIO


extension Branch: Queryable { }


extension QueryableProperty where QueryableType == Branch {
    
    
    /// Get specific branch
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    /// - Parameter name: Branch name
    public func get(org: String, repo: String, branch name: String) throws -> EventLoopFuture<Branch> {
        return try github.get(path: "repos/\(org)/\(repo)/branches/\(name)")
    }
    
    
    /// Get all available branches
    /// - Parameter org: Organization
    /// - Parameter repo: Repo
    public func get(org: String, repo: String) throws -> EventLoopFuture<[Branch]> {
        return try github.get(path: "repos/\(org)/\(repo)/branches")
    }
    
}


extension EventLoopFuture where Value == Branch {
    
    /// Latest commit on a branch
    public func latestCommit() -> EventLoopFuture<Commit> {
        return map { branch in
            return branch.commit
        }
    }
    
}
