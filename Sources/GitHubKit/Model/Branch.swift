//
//  Branch.swift
//  
//
//  Created by Ondrej Rafaj on 19/06/2019.
//

import Foundation


public struct Branch: Codable {
    
    public struct Links: Codable {
        
        public let html: String?
        public let linksSelf: String?
        
        enum CodingKeys: String, CodingKey {
            case html = "html"
            case linksSelf = "self"
        }
        
    }
    
    public struct Protection: Codable {
        
        public let enabled: Bool?
        public let requiredStatusChecks: RequiredStatusChecks?
        
        enum CodingKeys: String, CodingKey {
            case enabled = "enabled"
            case requiredStatusChecks = "required_status_checks"
        }
        
    }
    
    public struct RequiredStatusChecks: Codable {
        
        public let enforcementLevel: String?
        public let contexts: [String]?
        
        enum CodingKeys: String, CodingKey {
            case enforcementLevel = "enforcement_level"
            case contexts = "contexts"
        }
        
    }
    
    public let name: String
    public let commit: Commit
    public let links: Links?
    public let protected: Bool
    public let protection: Protection?
    public let protectionURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case commit = "commit"
        case links = "_links"
        case protected = "protected"
        case protection = "protection"
        case protectionURL = "protection_url"
    }
    
}
