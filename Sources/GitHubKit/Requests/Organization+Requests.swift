import NIO


extension Organization: Queryable { }


extension QueryableProperty where QueryableType == Organization {
    
    /// Get organization detail
    public func get(name: String) throws -> EventLoopFuture<Organization> {
        return try github.get(path: "orgs/\(name)")
    }
    
    /// Get all organizations for a user
    public func get(user: String) throws -> EventLoopFuture<[Organization]> {
        return try github.get(path: "users/\(user)/orgs")
    }
    
    /// Get all organizations for authenticated user
    public func get() throws -> EventLoopFuture<[Organization]> {
        return try github.get(path: "user/orgs")
    }
    
}
