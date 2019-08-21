import Foundation


public struct PR: Codable {
    
    public struct Location: Codable {
        
        public internal(set) var label: String?
        public internal(set) var ref: String?
        public internal(set) var sha: String?
        public internal(set) var user: Owner?
        public internal(set) var repo: Repo?
        
    }
    
    public struct Label: Codable {
        
        public internal(set) var id: Int?
        public internal(set) var nodeID: String?
        public internal(set) var url: String?
        public internal(set) var name: String?
        public internal(set) var labelDescription: String?
        public internal(set) var color: String?
        public internal(set) var labelDefault: Bool?
        
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
        
        public internal(set) var id: Int?
        public internal(set) var nodeID: String?
        public internal(set) var url: String?
        public internal(set) var name: String?
        public internal(set) var slug: String?
        public internal(set) var requestedTeamDescription: String?
        public internal(set) var privacy: String?
        public internal(set) var permission: String?
        public internal(set) var membersURL: String?
        public internal(set) var repositoriesURL: String?
        
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
            
            public internal(set) var href: String?
            
        }
        
        public internal(set) var linksSelf: Href?
        public internal(set) var html: Href?
        public internal(set) var issue: Href?
        public internal(set) var comments: Href?
        public internal(set) var reviewComments: Href?
        public internal(set) var reviewComment: Href?
        public internal(set) var commits: Href?
        public internal(set) var statuses: Href?
        
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
    
    public internal(set) var url: String
    public internal(set) var id: Int
    public internal(set) var nodeID: String
    public internal(set) var htmlURL: String
    public internal(set) var diffURL: String?
    public internal(set) var patchURL: String?
    public internal(set) var issueURL: String?
    public internal(set) var commitsURL: String?
    public internal(set) var reviewCommentsURL: String?
    public internal(set) var reviewCommentURL: String?
    public internal(set) var commentsURL: String?
    public internal(set) var statusesURL: String?
    public internal(set) var number: Int
    public internal(set) var state: String
    public internal(set) var locked: Bool?
    public internal(set) var title: String
    public internal(set) var user: Owner?
    public internal(set) var body: String?
    public internal(set) var labels: [Label]?
    public internal(set) var milestone: Milestone?
    public internal(set) var activeLockReason: String?
    public internal(set) var createdAt: String
    public internal(set) var updatedAt: String?
    public internal(set) var closedAt: String?
    public internal(set) var mergedAt: String?
    public internal(set) var mergeCommitSHA: String?
    public internal(set) var assignee: Owner?
    public internal(set) var assignees: [Owner]?
    public internal(set) var requestedReviewers: [Owner]?
    public internal(set) var requestedTeams: [RequestedTeam]?
    public internal(set) var head: Location?
    public internal(set) var base: Location?
    public internal(set) var links: Links?
    public internal(set) var authorAssociation: String?
    public internal(set) var draft: Bool?
    public internal(set) var merged: Bool?
    public internal(set) var mergeable: Bool?
    public internal(set) var rebaseable: Bool?
    public internal(set) var mergeableState: String?
    public internal(set) var mergedBy: Owner?
    public internal(set) var comments: Int?
    public internal(set) var reviewComments: Int?
    public internal(set) var maintainerCanModify: Bool?
    public internal(set) var commits: Int?
    public internal(set) var additions: Int?
    public internal(set) var deletions: Int?
    public internal(set) var changedFiles: Int?
    
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
