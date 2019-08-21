import Foundation


public struct Release: Codable {
    
    public struct Asset: Codable {
        
        public internal(set) var url: String?
        public internal(set) var browserDownloadURL: String?
        public internal(set) var id: Int
        public internal(set) var nodeID: String?
        public internal(set) var name: String?
        public internal(set) var label: String?
        public internal(set) var state: String?
        public internal(set) var contentType: String
        public internal(set) var size: Int
        public internal(set) var downloadCount: Int?
        public internal(set) var createdAt: String?
        public internal(set) var updatedAt: String?
        public internal(set) var uploader: Owner?
        
        enum CodingKeys: String, CodingKey {
            case url = "url"
            case browserDownloadURL = "browser_download_url"
            case id = "id"
            case nodeID = "node_id"
            case name = "name"
            case label = "label"
            case state = "state"
            case contentType = "content_type"
            case size = "size"
            case downloadCount = "download_count"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case uploader = "uploader"
        }
        
    }
    
    public internal(set) var url: String?
    public internal(set) var htmlURL: String?
    public internal(set) var assetsURL: String?
    public internal(set) var uploadURL: String?
    public internal(set) var tarballURL: String?
    public internal(set) var zipballURL: String?
    public internal(set) var id: Int
    public internal(set) var nodeID: String?
    public internal(set) var tagName: String
    public internal(set) var targetCommitish: String?
    public internal(set) var name: String
    public internal(set) var body: String?
    public internal(set) var draft: Bool
    public internal(set) var prerelease: Bool
    public internal(set) var createdAt: String?
    public internal(set) var publishedAt: String?
    public internal(set) var author: Owner?
    public internal(set) var assets: [Asset]?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case htmlURL = "html_url"
        case assetsURL = "assets_url"
        case uploadURL = "upload_url"
        case tarballURL = "tarball_url"
        case zipballURL = "zipball_url"
        case id = "id"
        case nodeID = "node_id"
        case tagName = "tag_name"
        case targetCommitish = "target_commitish"
        case name = "name"
        case body = "body"
        case draft = "draft"
        case prerelease = "prerelease"
        case createdAt = "created_at"
        case publishedAt = "published_at"
        case author = "author"
        case assets = "assets"
    }
    
}
