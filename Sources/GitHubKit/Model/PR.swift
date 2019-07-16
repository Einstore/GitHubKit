//
//  PR.swift
//  
//
//  Created by Ondrej Rafaj on 16/07/2019.
//

import Foundation


public struct PR: Codable {
    
    public struct Location: Codable {
        
        public let label: String?
        public let ref: String?
        public let sha: String?
        public let user: Owner?
        public let repo: Repo?
        
    }
    
    public struct Label: Codable {
        
        public let id: Int?
        public let nodeID: String?
        public let url: String?
        public let name: String?
        public let labelDescription: String?
        public let color: String?
        public let labelDefault: Bool?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case nodeID = "node_id"
            case url = "url"
            case name = "name"
            case labelDescription = "description"
            case color = "color"
            case labelDefault = "default"
        }
        
    }
    
    
    public struct RequestedTeam: Codable {
        
        public let id: Int?
        public let nodeID: String?
        public let url: String?
        public let name: String?
        public let slug: String?
        public let requestedTeamDescription: String?
        public let privacy: String?
        public let permission: String?
        public let membersURL: String?
        public let repositoriesURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case nodeID = "node_id"
            case url = "url"
            case name = "name"
            case slug = "slug"
            case requestedTeamDescription = "description"
            case privacy = "privacy"
            case permission = "permission"
            case membersURL = "members_url"
            case repositoriesURL = "repositories_url"
        }
        
    }
    
    public struct Links: Codable {
        
        public struct Href: Codable {
            
            public let href: String?
            
        }
        
        public let linksSelf: Href?
        public let html: Href?
        public let issue: Href?
        public let comments: Href?
        public let reviewComments: Href?
        public let reviewComment: Href?
        public let commits: Href?
        public let statuses: Href?
        
        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case html = "html"
            case issue = "issue"
            case comments = "comments"
            case reviewComments = "review_comments"
            case reviewComment = "review_comment"
            case commits = "commits"
            case statuses = "statuses"
        }
        
    }
    
    public let url: String
    public let id: Int
    public let nodeID: String
    public let htmlURL: String
    public let diffURL: String?
    public let patchURL: String?
    public let issueURL: String?
    public let commitsURL: String?
    public let reviewCommentsURL: String?
    public let reviewCommentURL: String?
    public let commentsURL: String?
    public let statusesURL: String?
    public let number: Int
    public let state: String
    public let locked: Bool?
    public let title: String
    public let user: Owner?
    public let body: String?
    public let labels: [Label]?
    public let milestone: Milestone?
    public let activeLockReason: String?
    public let createdAt: String
    public let updatedAt: String?
    public let closedAt: String?
    public let mergedAt: String?
    public let mergeCommitSHA: String?
    public let assignee: Owner?
    public let assignees: [Owner]?
    public let requestedReviewers: [Owner]?
    public let requestedTeams: [RequestedTeam]?
    public let head: Location?
    public let base: Location?
    public let links: Links?
    public let authorAssociation: String?
    public let draft: Bool?
    public let merged: Bool?
    public let mergeable: Bool?
    public let rebaseable: Bool?
    public let mergeableState: String?
    public let mergedBy: Owner?
    public let comments: Int?
    public let reviewComments: Int?
    public let maintainerCanModify: Bool?
    public let commits: Int?
    public let additions: Int?
    public let deletions: Int?
    public let changedFiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case nodeID = "node_id"
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
        case issueURL = "issue_url"
        case commitsURL = "commits_url"
        case reviewCommentsURL = "review_comments_url"
        case reviewCommentURL = "review_comment_url"
        case commentsURL = "comments_url"
        case statusesURL = "statuses_url"
        case number = "number"
        case state = "state"
        case locked = "locked"
        case title = "title"
        case user = "user"
        case body = "body"
        case labels = "labels"
        case milestone = "milestone"
        case activeLockReason = "active_lock_reason"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case mergedAt = "merged_at"
        case mergeCommitSHA = "merge_commit_sha"
        case assignee = "assignee"
        case assignees = "assignees"
        case requestedReviewers = "requested_reviewers"
        case requestedTeams = "requested_teams"
        case head = "head"
        case base = "base"
        case links = "_links"
        case authorAssociation = "author_association"
        case draft = "draft"
        case merged = "merged"
        case mergeable = "mergeable"
        case rebaseable = "rebaseable"
        case mergeableState = "mergeable_state"
        case mergedBy = "merged_by"
        case comments = "comments"
        case reviewComments = "review_comments"
        case maintainerCanModify = "maintainer_can_modify"
        case commits = "commits"
        case additions = "additions"
        case deletions = "deletions"
        case changedFiles = "changed_files"
    }
    
}
