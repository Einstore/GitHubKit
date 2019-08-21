import Foundation


public struct GitTree: Codable {
    
    public struct Object: Codable {
        
        public internal(set) var path: String
        public internal(set) var mode: String
        public internal(set) var type: String
        public internal(set) var size: Int?
        public internal(set) var sha: String
        public internal(set) var url: String?
        
    }
    
    public internal(set) var sha: String
    public internal(set) var url: String?
    public internal(set) var objects: [Object]?
    public internal(set) var truncated: Bool
    
    enum CodingKeys: String, CodingKey {
        case sha
        case url
        case objects = "tree"
        case truncated
    }
    
}
