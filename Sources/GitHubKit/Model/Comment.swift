import Foundation


public struct Comment: Codable {
    
    public struct Post: Codable {
        public internal(set) var body: String
    }
    
    public internal(set) var id: Int
    public internal(set) var nodeID: String
    public internal(set) var url: String?
    public internal(set) var htmlURL: String?
    public internal(set) var body: String
    public internal(set) var user: Owner
    public internal(set) var createdAt: String
    public internal(set) var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url
        case htmlURL = "html_url"
        case body
        case user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
}
