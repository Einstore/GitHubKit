import Foundation


public struct Tag: Codable {
    
    public struct List: Codable {
        
        public internal(set) var name: String
        public internal(set) var commit: Commit
        public internal(set) var zipballUrl: String?
        public internal(set) var tarballUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case name
            case commit
            case zipballUrl = "zipball_url"
            case tarballUrl = "tarball_url"
        }
        
    }
    
    public struct Object: Codable {
        
        public internal(set) var type: String?
        public internal(set) var sha: String?
        public internal(set) var url: String?
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case sha = "sha"
            case url = "url"
        }
        
    }

    public internal(set) var nodeID: String?
    public internal(set) var tag: String?
    public internal(set) var sha: String?
    public internal(set) var url: String?
    public internal(set) var message: String?
    public internal(set) var tagger: Author?
    public internal(set) var object: Object?
    public internal(set) var verification: Verification?
    
    enum CodingKeys: String, CodingKey {
        case nodeID = "node_id"
        case tag = "tag"
        case sha = "sha"
        case url = "url"
        case message = "message"
        case tagger = "tagger"
        case object = "object"
        case verification = "verification"
    }
    
}
