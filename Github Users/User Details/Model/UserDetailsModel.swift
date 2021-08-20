import Foundation

class UserDetails {
    var username: String
    var avatarURL: String
    var id: Int
    var followersCount: Int
    var repositoriesCount: Int

    init(username: String, avatarURL: String, id: Int, followersCount: Int, repositoriesCount: Int) {
        self.username = username
        self.avatarURL = avatarURL
        self.id = id
        self.followersCount = followersCount
        self.repositoriesCount = repositoriesCount
    }
}
