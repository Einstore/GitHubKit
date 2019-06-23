//
//  File 2.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import Foundation


public struct Release: Codable {
    
    public struct Asset: Codable {
        
        public let url: String?
        public let browserDownloadURL: String?
        public let id: Int
        public let nodeID: String?
        public let name: String?
        public let label: String?
        public let state: String?
        public let contentType: String
        public let size: Int
        public let downloadCount: Int?
        public let createdAt: String?
        public let updatedAt: String?
        public let uploader: Owner?
        
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
    
    public let url: String?
    public let htmlURL: String?
    public let assetsURL: String?
    public let uploadURL: String?
    public let tarballURL: String?
    public let zipballURL: String?
    public let id: Int
    public let nodeID: String?
    public let tagName: String
    public let targetCommitish: String?
    public let name: String
    public let body: String?
    public let draft: Bool
    public let prerelease: Bool
    public let createdAt: String?
    public let publishedAt: String?
    public let author: Owner?
    public let assets: [Asset]?
    
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
