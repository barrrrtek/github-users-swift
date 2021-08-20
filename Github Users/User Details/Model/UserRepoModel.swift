import Foundation

class UserRepo {
    var name: String
    var url: String
    var id: Int
    var stars: Int

    init(name: String, url: String, id: Int, stars: Int) {
        self.name = name
        self.url = url
        self.id = id
        self.stars = stars
    }
}
