import Foundation


public struct GitCommit: Codable {
    
    public struct Tree: Codable {
        
        public internal(set) var url: String
        public internal(set) var sha: String
        
        enum CodingKeys: String, CodingKey {
            case url = "url"
            case sha = "sha"
        }
        
    }
    
    public internal(set) var sha: String
    public internal(set) var url: String?
    public internal(set) var author: Author?
    public internal(set) var committer: Author?
    public internal(set) var message: String?
    public internal(set) var tree: Tree
    public internal(set) var parents: [Tree]?
    public internal(set) var verification: Verification?
    
    enum CodingKeys: String, CodingKey {
        case sha = "sha"
        case url = "url"
        case author = "author"
        case committer = "committer"
        case message = "message"
        case tree = "tree"
        case parents = "parents"
        case verification = "verification"
    }
    
}
