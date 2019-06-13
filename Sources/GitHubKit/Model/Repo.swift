//
//  Repo.swift
//  
//
//  Created by Ondrej Rafaj on 10/06/2019.
//

import Foundation


public struct Repo: Codable {
        
    public struct Permissions: Codable {
        
        public let admin: Bool
        public let push: Bool
        public let pull: Bool
        
        enum CodingKeys: String, CodingKey {
            case admin = "admin"
            case push = "push"
            case pull = "pull"
        }
        
    }
    
    public let id: Int
    public let nodeID: String?
    public let name: String
    public let fullName: String
    public let repoPrivate: Bool
    public let owner: Owner
    public let htmlURL: String
    public let repoDescription: String?
    public let fork: Bool
    public let url: String?
    public let forksURL: String?
    public let keysURL: String?
    public let collaboratorsURL: String?
    public let teamsURL: String?
    public let hooksURL: String?
    public let issueEventsURL: String?
    public let eventsURL: String?
    public let assigneesURL: String?
    public let branchesURL: String?
    public let tagsURL: String?
    public let blobsURL: String?
    public let gitTagsURL: String?
    public let gitRefsURL: String?
    public let treesURL: String?
    public let statusesURL: String?
    public let languagesURL: String?
    public let stargazersURL: String?
    public let contributorsURL: String?
    public let subscribersURL: String?
    public let subscriptionURL: String?
    public let commitsURL: String?
    public let gitCommitsURL: String?
    public let commentsURL: String?
    public let issueCommentURL: String?
    public let contentsURL: String?
    public let compareURL: String?
    public let mergesURL: String?
    public let archiveURL: String?
    public let downloadsURL: String?
    public let issuesURL: String?
    public let pullsURL: String?
    public let milestonesURL: String?
    public let notificationsURL: String?
    public let labelsURL: String?
    public let releasesURL: String?
    public let deploymentsURL: String?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let pushedAt: Date?
    public let gitURL: String?
    public let sshURL: String?
    public let cloneURL: String?
    public let svnURL: String?
    public let homepage: String?
    public let size: Int?
    public let stargazersCount: Int?
    public let watchersCount: Int?
    public let language: String?
    public let hasIssues: Bool?
    public let hasProjects: Bool?
    public let hasDownloads: Bool?
    public let hasWiki: Bool?
    public let hasPages: Bool?
    public let forksCount: Int?
    public let mirrorURL: String?
    public let archived: Bool?
    public let disabled: Bool?
    public let openIssuesCount: Int?
    public let license: String?
    public let forks: Int?
    public let openIssues: Int?
    public let watchers: Int?
    public let defaultBranch: String?
    public let permissions: Permissions?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case repoPrivate = "private"
        case owner = "owner"
        case htmlURL = "html_url"
        case repoDescription = "description"
        case fork = "fork"
        case url = "url"
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language = "language"
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case openIssuesCount = "open_issues_count"
        case license = "license"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case defaultBranch = "default_branch"
        case permissions = "permissions"
    }
    
}
