//
//  GitCommit.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import Foundation


public struct GitCommit: Codable {
    
    public struct Tree: Codable {
        
        public let url: String
        public let sha: String
        
        enum CodingKeys: String, CodingKey {
            case url = "url"
            case sha = "sha"
        }
        
    }
    
    public let sha: String
    public let url: String?
    public let author: Author?
    public let committer: Author?
    public let message: String?
    public let tree: Tree
    public let parents: [Tree]?
    public let verification: Verification?
    
    enum CodingKeys: String, CodingKey {
        case sha = "sha"
        case url = "url"
        case author = "author"
        case committer = "committer"
        case message = "message"
        case tree = "tree"
        case parents = "parents"
        case verification = "verification"
    }
    
}
