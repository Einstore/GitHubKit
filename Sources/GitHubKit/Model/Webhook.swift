//
//  Webhook.swift
//  
//
//  Created by Ondrej Rafaj on 20/06/2019.
//

import Foundation


public struct Webhook: Codable {
    
    public struct Post: Codable {
        
        public let name: String
        public let active: Bool
        public let events: [EventType]
        public let config: Config
        
        public init(active: Bool = true, events: [EventType] = [.push], config: Config) {
            self.name = "web"
            self.active = active
            self.events = events
            self.config = config
        }
        
    }
    
    public struct Config: Codable {
        
        public enum InsecureSSL: String, Codable {
            case yes = "1"
            case no = "0"
        }
        
        public let contentType: String?
        public let insecureSSL: InsecureSSL?
        public let url: String
        public let secret: String?
        
        enum CodingKeys: String, CodingKey {
            case contentType = "content_type"
            case insecureSSL = "insecure_ssl"
            case url = "url"
            case secret = "secret"
        }
        
        public init(contentType: String? = nil, insecureSSL: InsecureSSL? = .no, url: String, secret: String? = nil) {
            self.contentType = contentType
            self.insecureSSL = insecureSSL
            self.url = url
            self.secret = secret
        }
        
    }
    
    public struct LastResponse: Codable {
        
        public let code: Int?
        public let status: String?
        public let message: String?
        
    }
    
    public enum EventType: String, Codable {
        
        /// Any time any event is triggered (Wildcard Event)
        case all = "*"
        
        // MARK: Repo hooks
        
        /// Triggered when a check run is created, rerequested, completed, or has a requested_action.
        case check_run
        
        /// Triggered when a check suite is completed, requested, or rerequested.
        case check_suite
        
        /// Triggered when a commit comment is created.
        case commit_comment
        
        /// Represents a created branch or tag.
        case create
        
        /// Represents a deleted branch or tag.
        case delete
        
        /// Triggered when an issue comment is created, edited, or deleted.
        case issue_comment
        
        /// Triggered when an issue is opened, edited, deleted, transferred, pinned, unpinned, closed, reopened, assigned, unassigned, labeled, unlabeled, locked, unlocked, milestoned, or demilestoned.
        case issues
        
        /// Triggered when a pull request is assigned, unassigned, labeled, unlabeled, opened, edited, closed, reopened, synchronize, ready_for_review, locked, unlocked or when a pull request review is requested or removed.
        case pull_request
        
        /// Triggered when a pull request review is submitted into a non-pending state, the body is edited, or the review is dismissed.
        case pull_request_review
        
        /// Triggered when a comment on a pull request's unified diff is created, edited, or deleted (in the Files Changed tab).
        case pull_request_review_comment
        
        /// Triggered on a push to a repository branch. Branch pushes and repository tag pushes also trigger webhook push events. This is the default event.
        case push
        
        /// Triggered when a release is published, unpublished, created, edited, deleted, or prereleased.
        case release
        
        // MARK: Organization hooks
        
        /// Triggered when an organization is deleted and renamed, and when a user is added, removed, or invited to an organization. Organization hooks only.
        case organization
        
        /// Triggered when a repository is created, archived, unarchived, renamed, edited, transferred, made public, or made private. Organization hooks are also triggered when a repository is deleted.
        case repository
        
        enum CodingKeys: String, CodingKey {
            case all
            case check_run
            case check_suite
            case commit_comment
            case create
            case delete
            case issue_comment
            case issues
            case pull_request
            case pull_request_review
            case pull_request_review_comment
            case push
            case release
            case organization
            case repository
        }
        
    }
    
    public let type: String?
    public let id: Int
    public let name: String
    public let active: Bool
    public let events: [EventType]
    public let config: Config
    public let updatedAt: String?
    public let createdAt: String?
    public let url: String?
    public let testURL: String?
    public let pingURL: String?
    public let lastResponse: LastResponse?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case name = "name"
        case active = "active"
        case events = "events"
        case config = "config"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case url = "url"
        case testURL = "test_url"
        case pingURL = "ping_url"
        case lastResponse = "last_response"
    }
    
}
