//
//  Organization.swift
//  
//
//  Created by Ondrej Rafaj on 10/06/2019.
//

import Foundation


/// Organization
public struct Organization: Codable {
    
    public struct Plan: Codable {
        
        public let name: String?
        public let space: Int?
        public let privateRepos: Int?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case space = "space"
            case privateRepos = "private_repos"
        }

    }
    
    public let login: String
    public let id: Int
    public let nodeID: String?
    public let url: String?
    public let reposURL: String?
    public let eventsURL: String?
    public let hooksURL: String?
    public let issuesURL: String?
    public let membersURL: String?
    public let publicMembersURL: String?
    public let avatarURL: String?
    public let organizationDescription: String?
    public let name: String?
    public let company: String?
    public let blog: String?
    public let location: String?
    public let email: String?
    public let isVerified: Bool?
    public let hasOrganizationProjects: Bool?
    public let hasRepositoryProjects: Bool?
    public let publicRepos: Int?
    public let publicGists: Int?
    public let followers: Int?
    public let following: Int?
    public let htmlURL: String?
    public let createdAt: Date?
    public let type: String?
    public let totalPrivateRepos: Int?
    public let ownedPrivateRepos: Int?
    public let privateGists: Int?
    public let diskUsage: Int?
    public let collaborators: Int?
    public let billingEmail: String?
    public let plan: Plan?
    public let defaultRepositorySettings: String?
    public let membersCanCreateRepositories: Bool?
    public let twoFactorRequirementEnabled: Bool?
    public let membersAllowedRepositoryCreationType: String?
    
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
