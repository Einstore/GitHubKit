import Foundation


public struct Owner: Codable {
    
    public internal(set) var login: String
    public internal(set) var id: Int
    public internal(set) var nodeID: String?
    public internal(set) var avatarURL: String?
    public internal(set) var gravatarID: String?
    public internal(set) var url: String?
    public internal(set) var htmlURL: String?
    public internal(set) var followersURL: String?
    public internal(set) var followingURL: String?
    public internal(set) var gistsURL: String?
    public internal(set) var starredURL: String?
    public internal(set) var subscriptionsURL: String?
    public internal(set) var organizationsURL: String?
    public internal(set) var reposURL: String?
    public internal(set) var eventsURL: String?
    public internal(set) var receivedEventsURL: String?
    public internal(set) var type: String?
    public internal(set) var siteAdmin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
    }
    
}
