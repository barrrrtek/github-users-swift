import Foundation

struct UserDetails: Codable {
    var username: String
    var avatarURL: String
    var id: Int
    var followersCount: Int
    var repositoriesCount: Int
}
