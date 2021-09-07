import Foundation

struct UserModel: Codable {
    var login: String
    var avatar_url: String
    var id: Int
}

struct UsersResposne: Codable {
    var items: [UserModel] = []
}
