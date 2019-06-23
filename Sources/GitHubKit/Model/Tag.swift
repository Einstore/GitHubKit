//
//  Tag.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import Foundation


public struct Tag: Codable {
    
    public struct Object: Codable {
        
        public let type: String?
        public let sha: String?
        public let url: String?
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case sha = "sha"
            case url = "url"
        }
        
    }

    public let nodeID: String?
    public let tag: String?
    public let sha: String?
    public let url: String?
    public let message: String?
    public let tagger: Author?
    public let object: Object?
    public let verification: Verification?
    
    enum CodingKeys: String, CodingKey {
        case nodeID = "node_id"
        case tag = "tag"
        case sha = "sha"
        case url = "url"
        case message = "message"
        case tagger = "tagger"
        case object = "object"
        case verification = "verification"
    }
    
}
