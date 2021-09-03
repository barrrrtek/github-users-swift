import Foundation

struct UserDetails: Codable {
    var login: String
    var avatar_url: String
    var id: Int
    var followers: Int
    var public_repos: Int
}
