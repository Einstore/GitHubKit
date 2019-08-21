import Foundation


public struct Commit: Codable {
    
    public struct Tree: Codable {
        public internal(set) var sha: String?
        public internal(set) var url: String?
    }
    
    public struct Author: Codable {
        
        public internal(set) var gravatarID: String?
        public internal(set) var avatarURL: String?
        public internal(set) var url: String?
        public internal(set) var id: Int?
        public internal(set) var login: String?
        
        enum CodingKeys: String, CodingKey {
            case gravatarID = "gravatar_id"
            case avatarURL = "avatar_url"
            case url = "url"
            case id = "id"
            case login = "login"
        }
        
    }
    
    public struct Info: Codable {

        public internal(set) var author: Author?
        public internal(set) var url: String?
        public internal(set) var message: String?
        public internal(set) var tree: Tree?
        public internal(set) var committer: Author?
        public internal(set) var verification: Verification?
    }

    
    public internal(set) var sha: String
    public internal(set) var nodeID: String?
    public internal(set) var commit: Info?
    public internal(set) var author: Author?
    public internal(set) var parents: [Tree]?
    public internal(set) var url: String
    public internal(set) var committer: Author?
    
    enum CodingKeys: String, CodingKey {
        case sha = "sha"
        case nodeID = "node_id"
        case commit = "commit"
        case author = "author"
        case parents = "parents"
        case url = "url"
        case committer = "committer"
    }
    
    init(sha: String, nodeID: String? = nil, commit: Info? = nil, author: Author? = nil, parents: [Tree]? = nil, url: String, committer: Author? = nil) {
        self.sha = sha
        self.nodeID = nodeID
        self.commit = commit
        self.author = author
        self.parents = parents
        self.url = url
        self.committer = committer
    }
    
}
