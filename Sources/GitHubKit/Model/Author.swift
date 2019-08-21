import Foundation


public struct Author: Codable {
    
    public internal(set) var name: String?
    public internal(set) var date: String?
    public internal(set) var email: String?
    
    init(name: String?, date: String?, email: String?) {
        self.name = name
        self.date = date
        self.email = email
    }
    
}
