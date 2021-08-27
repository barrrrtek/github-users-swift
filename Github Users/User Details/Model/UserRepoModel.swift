import Foundation

class UserRepo {
    var name: String?
    var url: String?
    var id: Int?
    var stars: Int?
    var userId: Int?

    init(name: String, url: String, id: Int, stars: Int, userId: Int) {
        self.name = name
        self.url = url
        self.id = id
        self.stars = stars
        self.userId = userId
    }
}
