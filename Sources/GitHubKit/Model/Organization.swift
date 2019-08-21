import Foundation


/// Organization
public struct Organization: Codable {
    
    public struct Plan: Codable {
        
        public internal(set) var name: String?
        public internal(set) var space: Int?
        public internal(set) var privateRepos: Int?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case space = "space"
            case privateRepos = "private_repos"
        }

    }
    
    public internal(set) var login: String
    public internal(set) var id: Int
    public internal(set) var nodeID: String?
    public internal(set) var url: String?
    public internal(set) var reposURL: String?
    public internal(set) var eventsURL: String?
    public internal(set) var hooksURL: String?
    public internal(set) var issuesURL: String?
    public internal(set) var membersURL: String?
    public internal(set) var publicMembersURL: String?
    public internal(set) var avatarURL: String?
    public internal(set) var organizationDescription: String?
    public internal(set) var name: String?
    public internal(set) var company: String?
    public internal(set) var blog: String?
    public internal(set) var location: String?
    public internal(set) var email: String?
    public internal(set) var isVerified: Bool?
    public internal(set) var hasOrganizationProjects: Bool?
    public internal(set) var hasRepositoryProjects: Bool?
    public internal(set) var publicRepos: Int?
    public internal(set) var publicGists: Int?
    public internal(set) var followers: Int?
    public internal(set) var following: Int?
    public internal(set) var htmlURL: String?
    public internal(set) var createdAt: String?
    public internal(set) var type: String?
    public internal(set) var totalPrivateRepos: Int?
    public internal(set) var ownedPrivateRepos: Int?
    public internal(set) var privateGists: Int?
    public internal(set) var diskUsage: Int?
    public internal(set) var collaborators: Int?
    public internal(set) var billingEmail: String?
    public internal(set) var plan: Plan?
    public internal(set) var defaultRepositorySettings: String?
    public internal(set) var membersCanCreateRepositories: Bool?
    public internal(set) var twoFactorRequirementEnabled: Bool?
    public internal(set) var membersAllowedRepositoryCreationType: String?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case url = "url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case hooksURL = "hooks_url"
        case issuesURL = "issues_url"
        case membersURL = "members_url"
        case publicMembersURL = "public_members_url"
        case avatarURL = "avatar_url"
        case organizationDescription = "description"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case isVerified = "is_verified"
        case hasOrganizationProjects = "has_organization_projects"
        case hasRepositoryProjects = "has_repository_projects"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case htmlURL = "html_url"
        case createdAt = "created_at"
        case type = "type"
        case totalPrivateRepos = "total_private_repos"
        case ownedPrivateRepos = "owned_private_repos"
        case privateGists = "private_gists"
        case diskUsage = "disk_usage"
        case collaborators = "collaborators"
        case billingEmail = "billing_email"
        case plan = "plan"
        case defaultRepositorySettings = "default_repository_settings"
        case membersCanCreateRepositories = "members_can_create_repositories"
        case twoFactorRequirementEnabled = "two_factor_requirement_enabled"
        case membersAllowedRepositoryCreationType = "members_allowed_repository_creation_type"
    }
    
}
