//
//  Comment.swift
//  
//
//  Created by Ondrej Rafaj on 13/06/2019.
//

import Foundation


public struct Comment: Codable {
    
    public struct Post: Codable {
        public let body: String
    }
    
    public let id: Int
    public let nodeID: String
    public let url: String?
    public let htmlURL: String?
    public let body: String
    public let user: Owner
    public let createdAt: String
    public let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url
        case htmlURL = "html_url"
        case body
        case user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
}
