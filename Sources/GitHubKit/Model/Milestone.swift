//
//  Milestone.swift
//  
//
//  Created by Ondrej Rafaj on 16/07/2019.
//

import Foundation


public struct Milestone: Codable {
    
    public let url: String?
    public let htmlURL: String?
    public let labelsURL: String?
    public let id: Int?
    public let nodeID: String?
    public let number: Int?
    public let state: String?
    public let title: String?
    public let milestoneDescription: String?
    public let creator: Owner?
    public let openIssues: Int?
    public let closedIssues: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let closedAt: String?
    public let dueOn: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case htmlURL = "html_url"
        case labelsURL = "labels_url"
        case id = "id"
        case nodeID = "node_id"
        case number = "number"
        case state = "state"
        case title = "title"
        case milestoneDescription = "description"
        case creator = "creator"
        case openIssues = "open_issues"
        case closedIssues = "closed_issues"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case dueOn = "due_on"
    }
    
}
