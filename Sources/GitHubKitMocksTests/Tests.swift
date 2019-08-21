@testable import GitHubKitMocks
import XCTest


class Tests: XCTestCase {
    
    var github: GitHubMock!
    
    override func setUp() {
        super.setUp()
        
        github = GitHubMock()
    }
    
    func testGet() {
        let branch = Branch()
        github.add(response: branch, path: "repos/org/repo/branches", method: .GET)
        let r = try! Branch.query(on: github).get(org: "org", repo: "repo").wait()
        print(r)
    }
    
}
