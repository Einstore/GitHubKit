import Foundation


public struct File: Codable {
    
    public enum Error: Swift.Error {
        case missingDownloadUrl
        case notFile(String)
    }
    
    public struct Links: Codable {
        public internal(set) var git: String
        public internal(set) var linkSelf: String
        public internal(set) var html: String
        
        enum CodingKeys: String, CodingKey {
            case git = "git"
            case linkSelf = "self"
            case html = "html"
        }
        
    }
    
    public internal(set) var type: String
    public internal(set) var encoding: String
    public internal(set) var size: Int
    public internal(set) var name: String
    public internal(set) var path: String
    public internal(set) var content: String?
    public internal(set) var sha: String
    public internal(set) var target: String?
    public internal(set) var submoduleGitUrl: String?
    public internal(set) var url: String
    public internal(set) var gitURL: String
    public internal(set) var htmlURL: String
    public internal(set) var downloadURL: String?
    public internal(set) var links: Links
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case encoding = "encoding"
        case size = "size"
        case name = "name"
        case path = "path"
        case content = "content"
        case sha = "sha"
        case target = "target"
        case submoduleGitUrl = "submodule_git_url"
        case url = "url"
        case gitURL = "git_url"
        case htmlURL = "html_url"
        case downloadURL = "download_url"
        case links = "_links"
    }
    
}
