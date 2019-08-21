import Foundation


public struct Verification: Codable {
    
    public internal(set) var verified: Bool?
    public internal(set) var reason: String?
    public internal(set) var signature: String?
    public internal(set) var payload: String?
    
    enum CodingKeys: String, CodingKey {
        case verified = "verified"
        case reason = "reason"
        case signature = "signature"
        case payload = "payload"
    }
    
}
