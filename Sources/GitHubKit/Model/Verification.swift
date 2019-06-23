//
//  Verification.swift
//  
//
//  Created by Ondrej Rafaj on 23/06/2019.
//

import Foundation


public struct Verification: Codable {
    
    public let verified: Bool?
    public let reason: String?
    public let signature: String?
    public let payload: String?
    
    enum CodingKeys: String, CodingKey {
        case verified = "verified"
        case reason = "reason"
        case signature = "signature"
        case payload = "payload"
    }
    
}
