import Foundation

class UserModel {
    var username: String
    var avatarURL: String
    var id: Int

    init(username: String, avatarURL: String, id: Int) {
        self.username = username
        self.avatarURL = avatarURL
        self.id = id
    }
}
