import Foundation


public struct GitBlob: Codable {
    
    public internal(set) var content: String
    public internal(set) var encoding: String
    public internal(set) var url: String?
    public internal(set) var sha: String
    public internal(set) var size: Int?
    
}
