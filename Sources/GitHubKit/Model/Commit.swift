//
//  File 2.swift
//  
//
//  Created by Ondrej Rafaj on 19/06/2019.
//

import Foundation


public struct Commit: Codable {
    
    public struct Tree: Codable {
        public let sha: String?
        public let url: String?
    }
    
    public struct Author: Codable {
        
        public let gravatarID: String?
        public let avatarURL: String?
        public let url: String?
        public let id: Int?
        public let login: String?
        
        enum CodingKeys: String, CodingKey {
            case gravatarID = "gravatar_id"
            case avatarURL = "avatar_url"
            case url = "url"
            case id = "id"
            case login = "login"
        }
        
    }
    
    public struct Info: Codable {
        
        public struct Author: Codable {
            public let name: String?
            public let date: Date?
            public let email: String?
        }
        
        public struct Verification: Codable {
            public let verified: Bool?
            public let reason: String?
        }

        
        public let author: Author?
        public let url: String?
        public let message: String?
        public let tree: Tree?
        public let committer: Author?
        public let verification: Verification?
    }

    
    public let sha: String
    public let nodeID: String?
    public let commit: Info?
    public let author: Author?
    public let parents: [Tree]?
    public let url: String
    public let committer: Author?
    
    enum CodingKeys: String, CodingKey {
        case sha = "sha"
        case nodeID = "node_id"
        case commit = "commit"
        case author = "author"
        case parents = "parents"
        case url = "url"
        case committer = "committer"
    }
    
}
