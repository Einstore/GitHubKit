# GitHubKit

Super simple to use Github API client library written for Vapor 4

## Functionality

The below probably don't contain all methods from the spec but it's a good start ...

- [x] Organizations
- [x] Repos
- [x] Files
- [x] File contents

## Usage

#### Add to your Package.swift file

```swift
.package(url: "https://github.com/Einstore/GitHubKit.git", from: "1.0.0")
```

Don't forget about your target

```swift
.target(
    name: "App",
    x: [
        "Vapor",
        "GitHubKit"
    ]
)
```

#### Configure a service
```swift
s.register(Github.self) { container in
    let config = Github.Config(
        username: "rafiki270",
        token: "6ae2csf8a9190be8fdgfa864aaeaa3bgff1bga", // This is my real token! please do not use!!!
        server: "https://github.example.com/api/v3/" // For enterprise github servers (optional)
    )
    return try Github(config, on: container)
}
```

#### Make a route?

```swift
import GitHubKit

r.get("github", "organizations") { req -> EventLoopFuture<[Organization]> in
    return try Organization.query(on: c).getAll().map() { orgs in
        return orgs
    }
}
```

## Development

Adding a new API call is ... surprisingly super simple too

Lets say you need to add a detail of a user

#### Go to the documentation

https://developer.github.com/v3/users/

#### Autogenerate a model

Copy the example JSON, for example:

```json
{
  "login": "octocat",
  "id": 1,
  "node_id": "MDQ6VXNlcjE=",
  "avatar_url": "https://github.com/images/error/octocat_happy.gif",
  "gravatar_id": "",
  "url": "https://api.github.com/users/octocat",
  "html_url": "https://github.com/octocat",
  "followers_url": "https://api.github.com/users/octocat/followers",
  "following_url": "https://api.github.com/users/octocat/following{/other_user}",
  "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
  "organizations_url": "https://api.github.com/users/octocat/orgs",
  "repos_url": "https://api.github.com/users/octocat/repos",
  "events_url": "https://api.github.com/users/octocat/events{/privacy}",
  "received_events_url": "https://api.github.com/users/octocat/received_events",
  "type": "User",
  "site_admin": false,
  "name": "monalisa octocat",
  "company": "GitHub",
  "blog": "https://github.com/blog",
  "location": "San Francisco",
  "email": "octocat@github.com",
  "hireable": false,
  "bio": "There once was...",
  "public_repos": 2,
  "public_gists": 1,
  "followers": 20,
  "following": 0,
  "created_at": "2008-01-14T04:33:35Z",
  "updated_at": "2008-01-14T04:33:35Z"
}
```

Go to the https://app.quicktype.io and convert the JSON into a model ... you might want to mess a bit with the settings to keep the models consistent with ones in the project already. Also, any sub structs (unless they can be used elsewhere) should be moved inside of the parent model. 

Oh yeah ... and call the main class `User`! :) ...

Import `Vapor` and conform the main model to `Content` instead of `Codable`.

#### Make a request extension

First you need to conform the `User` model to `Queryable`. This will enable the `User.query(on: container)` method.

```swift
extension User: Queryable { }
```

Next we create an extension on `QueryableProperty` which is generated each time you request a query on a container from the previous step. Make sure you specify the `QueryableType == User`

```swift
extension QueryableProperty where QueryableType == User {
    
    /// Get all organizations for authenticated user
    public func get() throws -> EventLoopFuture<User> {
        return try github.get(path: "user")
    }
    
}
```

#### All done

You should be able to call `try User.query(on: c).get()` and get an `EventLoopFuture<User>` with the details of your authenticated user.

### Author

**Ondrej Rafaj** @rafiki270

(It wasn't my token after all, was it?!)

### License

MIT; See LICENSE file for details.
