//
//  File.swift
//  
//
//  Created by Ondrej Rafaj on 11/06/2019.
//

import Vapor


public struct File: Content {
    
    public enum Error: Swift.Error {
        case missingDownloadUrl
        case notFile(String)
    }
    
    public struct Links: Codable {
        public let git: String
        public let linkSelf: String
        public let html: String
        
        enum CodingKeys: String, CodingKey {
            case git = "git"
            case linkSelf = "self"
            case html = "html"
        }
        
    }
    
    public let type: String
    public let encoding: String
    public let size: Int
    public let name: String
    public let path: String
    public let content: String?
    public let sha: String
    public let target: String?
    public let submoduleGitUrl: String?
    public let url: String
    public let gitURL: String
    public let htmlURL: String
    public let downloadURL: String?
    public let links: Links
    
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
