//
//  Query.swift
//  
//
//  Created by Ondrej Rafaj on 10/06/2019.
//

import Vapor


public struct QueryableProperty<QueryableType> {
    
    /// Queryable element accessor
    public var element: QueryableType?
    
    let github: Github
    
    init(_ obj: QueryableType? = nil, github: Github) {
        element = obj
        self.github = github
    }
    
}

/// Queryable protocol
public protocol Queryable {
    
    /// Supported testable type
    associatedtype ObjectType

    /// Main static function to access github queries
    static func query(on github: Github) -> QueryableProperty<ObjectType>
    
    /// Main static function to access github queries
    static func query(on container: Container) throws -> QueryableProperty<ObjectType>
    
}


extension Queryable {
    
    /// Main static function to access github queries
    public static func query(on github: Github) -> QueryableProperty<Self> {
        return QueryableProperty<Self>(github: github)
    }
    
    /// Main static function to access github queries
    public static func query(on c: Container) throws -> QueryableProperty<Self> {
        let github = try c.make(Github.self)
        return QueryableProperty<Self>(github: github)
    }
    
}
