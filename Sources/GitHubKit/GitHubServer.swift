import Foundation


/// Server value convertible
public protocol GitHubServerConvertible {
    var value: String { get }
}

/// Predefined github server values
public enum GitHubServer: GitHubServerConvertible {
    
    /// api.github.com
    case github
    
    /// Enterprise GitHub
    case enterprise(String)
    
    /// Server URL
    public var value: String {
        switch self {
        case .github:
            return "https://api.github.com"
        case .enterprise(let url):
            return url
        }
    }
}
