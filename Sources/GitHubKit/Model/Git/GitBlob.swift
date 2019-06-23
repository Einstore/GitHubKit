//
//  GitBlob.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import Foundation


public struct GitBlob: Codable {
    
    public let content: String
    public let encoding: String
    public let url: String?
    public let sha: String
    public let size: Int?
    
}
