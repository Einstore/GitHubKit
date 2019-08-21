import Foundation


public struct Milestone: Codable {
    
    public internal(set) var url: String?
    public internal(set) var htmlURL: String?
    public internal(set) var labelsURL: String?
    public internal(set) var id: Int?
    public internal(set) var nodeID: String?
    public internal(set) var number: Int?
    public internal(set) var state: String?
    public internal(set) var title: String?
    public internal(set) var milestoneDescription: String?
    public internal(set) var creator: Owner?
    public internal(set) var openIssues: Int?
    public internal(set) var closedIssues: Int?
    public internal(set) var createdAt: String?
    public internal(set) var updatedAt: String?
    public internal(set) var closedAt: String?
    public internal(set) var dueOn: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case htmlURL = "html_url"
        case labelsURL = "labels_url"
        case id = "id"
        case nodeID = "node_id"
        case number = "number"
        case state = "state"
        case title = "title"
        case milestoneDescription = "description"
        case creator = "creator"
        case openIssues = "open_issues"
        case closedIssues = "closed_issues"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case dueOn = "due_on"
    }
    
}
