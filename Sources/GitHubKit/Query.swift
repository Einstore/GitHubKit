import Foundation


public struct QueryableProperty<QueryableType> {
    
    /// Queryable element accessor
    public var element: QueryableType?
    
    let github: GitHubClient
    
    init(_ obj: QueryableType? = nil, github: GitHubClient) {
        element = obj
        self.github = github
    }
    
}

/// Queryable protocol
public protocol Queryable {
    
    /// Supported testable type
    associatedtype ObjectType

    /// Main static function to access github queries
    static func query(on github: GitHubClient) -> QueryableProperty<ObjectType>
    
}


extension Queryable {
    
    /// Main static function to access github queries
    public static func query(on github: GitHubClient) -> QueryableProperty<Self> {
        return QueryableProperty<Self>(github: github)
    }
    
}
