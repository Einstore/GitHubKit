import Foundation


public struct Branch: Codable {
    
    public struct Links: Codable {
        
        public internal(set) var html: String?
        public internal(set) var linksSelf: String?
        
        enum CodingKeys: String, CodingKey {
            case html = "html"
            case linksSelf = "self"
        }
        
        init(html: String? = nil, linksSelf: String? = nil) {
            self.html = html
            self.linksSelf = linksSelf
        }
        
    }
    
    public struct Protection: Codable {
        
        public internal(set) var enabled: Bool?
        public internal(set) var requiredStatusChecks: RequiredStatusChecks?
        
        enum CodingKeys: String, CodingKey {
            case enabled = "enabled"
            case requiredStatusChecks = "required_status_checks"
        }
        
        init(enabled: Bool? = nil, requiredStatusChecks: RequiredStatusChecks? = nil) {
            self.enabled = enabled
            self.requiredStatusChecks = requiredStatusChecks
        }
        
    }
    
    public struct RequiredStatusChecks: Codable {
        
        public internal(set) var enforcementLevel: String?
        public internal(set) var contexts: [String]?
        
        enum CodingKeys: String, CodingKey {
            case enforcementLevel = "enforcement_level"
            case contexts = "contexts"
        }
        
        init(enforcementLevel: String? = nil, contexts: [String]? = nil) {
            self.enforcementLevel = enforcementLevel
            self.contexts = contexts
        }
        
    }
    
    public internal(set) var name: String
    public internal(set) var commit: Commit
    public internal(set) var links: Links?
    public internal(set) var protected: Bool
    public internal(set) var protection: Protection?
    public internal(set) var protectionURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case commit = "commit"
        case links = "_links"
        case protected = "protected"
        case protection = "protection"
        case protectionURL = "protection_url"
    }
    
    init(name: String, commit: Commit, links: Links? = nil, protected: Bool = false, protection: Protection? = nil, protectionURL: String? = nil) {
        self.name = name
        self.commit = commit
        self.links = links
        self.protected = protected
        self.protection = protection
        self.protectionURL = protectionURL
    }
    
}
