import GitHubKitMocks
@testable import GitHubKit
import XCTest


class Tests: XCTestCase {
    
    var github: GitHubMock!
    
    override func setUp() {
        super.setUp()
        
        github = GitHubMock()
    }
    
    func testGet() {
        let branch = Branch(
            name: "test",
            commit: Commit(sha: "test-sha", url: "test://url")
        )
        let res = [branch]
        github.add(response: res, path: "repos/org/repo/branches", method: .GET)
        let r = try! Branch.query(on: github).get(org: "org", repo: "repo").wait()
        
        XCTAssertEqual(res[0].name, r[0].name)
    }
    
}
