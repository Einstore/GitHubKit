import Foundation


public struct Repo: Codable {
        
    public struct Permissions: Codable {
        
        public internal(set) var admin: Bool
        public internal(set) var push: Bool
        public internal(set) var pull: Bool
        
        enum CodingKeys: String, CodingKey {
            case admin = "admin"
            case push = "push"
            case pull = "pull"
        }
        
    }
    
    public internal(set) var id: Int
    public internal(set) var nodeID: String?
    public internal(set) var name: String
    public internal(set) var fullName: String
    public internal(set) var repoPrivate: Bool
    public internal(set) var owner: Owner
    public internal(set) var htmlURL: String
    public internal(set) var repoDescription: String?
    public internal(set) var fork: Bool
    public internal(set) var url: String?
    public internal(set) var forksURL: String?
    public internal(set) var keysURL: String?
    public internal(set) var collaboratorsURL: String?
    public internal(set) var teamsURL: String?
    public internal(set) var hooksURL: String?
    public internal(set) var issueEventsURL: String?
    public internal(set) var eventsURL: String?
    public internal(set) var assigneesURL: String?
    public internal(set) var branchesURL: String?
    public internal(set) var tagsURL: String?
    public internal(set) var blobsURL: String?
    public internal(set) var gitTagsURL: String?
    public internal(set) var gitRefsURL: String?
    public internal(set) var treesURL: String?
    public internal(set) var statusesURL: String?
    public internal(set) var languagesURL: String?
    public internal(set) var stargazersURL: String?
    public internal(set) var contributorsURL: String?
    public internal(set) var subscribersURL: String?
    public internal(set) var subscriptionURL: String?
    public internal(set) var commitsURL: String?
    public internal(set) var gitCommitsURL: String?
    public internal(set) var commentsURL: String?
    public internal(set) var issueCommentURL: String?
    public internal(set) var contentsURL: String?
    public internal(set) var compareURL: String?
    public internal(set) var mergesURL: String?
    public internal(set) var archiveURL: String?
    public internal(set) var downloadsURL: String?
    public internal(set) var issuesURL: String?
    public internal(set) var pullsURL: String?
    public internal(set) var milestonesURL: String?
    public internal(set) var notificationsURL: String?
    public internal(set) var labelsURL: String?
    public internal(set) var releasesURL: String?
    public internal(set) var deploymentsURL: String?
    public internal(set) var createdAt: String
    public internal(set) var updatedAt: String?
    public internal(set) var pushedAt: String?
    public internal(set) var gitURL: String?
    public internal(set) var sshURL: String?
    public internal(set) var cloneURL: String?
    public internal(set) var svnURL: String?
    public internal(set) var homepage: String?
    public internal(set) var size: Int?
    public internal(set) var stargazersCount: Int?
    public internal(set) var watchersCount: Int?
    public internal(set) var language: String?
    public internal(set) var hasIssues: Bool?
    public internal(set) var hasProjects: Bool?
    public internal(set) var hasDownloads: Bool?
    public internal(set) var hasWiki: Bool?
    public internal(set) var hasPages: Bool?
    public internal(set) var forksCount: Int?
    public internal(set) var mirrorURL: String?
    public internal(set) var archived: Bool?
    public internal(set) var disabled: Bool?
    public internal(set) var openIssuesCount: Int?
    public internal(set) var license: String?
    public internal(set) var forks: Int?
    public internal(set) var openIssues: Int?
    public internal(set) var watchers: Int?
    public internal(set) var defaultBranch: String?
    public internal(set) var permissions: Permissions?
    
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
