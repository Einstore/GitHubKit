import Foundation

public struct License: Codable {

    public internal(set) var key: String?
    public internal(set) var name: String?
    public internal(set) var spdxID: String?
    public internal(set) var url: String?
    public internal(set) var nodeID: String?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdxID = "spdx_id"
        case url = "url"
        case nodeID = "node_id"
    }

}
