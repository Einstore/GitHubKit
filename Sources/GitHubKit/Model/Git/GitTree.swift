//
//  GitTree.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import Foundation


public struct GitTree: Codable {
    
    public struct Object: Codable {
        
        public let path: String
        public let mode: String
        public let type: String
        public let size: Int?
        public let sha: String
        public let url: String?
        
    }
    
    public let sha: String
    public let url: String?
    public let objects: [Object]?
    public let truncated: Bool
    
    enum CodingKeys: String, CodingKey {
        case sha
        case url
        case objects = "tree"
        case truncated
    }
    
}
