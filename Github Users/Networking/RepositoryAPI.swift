import Foundation

class RepositoryAPI {
    var listOfUsers: [UserModel]?
    var listOfDetailsUsers: [UserDetails]?
    var userReposList: [UserRepo]?
    
    func fetchUsersFromAPI(_ searchedText: String) {
        let session = URLSession.shared
        let url = URL(string: "https://api.github.com/search/users?q=\(searchedText.lowercased())&per_page=100")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
    
    func fetchUserDetailsFromAPI(_ userId: Int) {
        let _: String = "https://api.github.com/user/\(userId)"
    }
    
    func fetchUserReposFromAPI(_ userId: Int) {
        let currentPage = 1
        let _: String = "https://api.github.com/user/\(userId)/repos?per_page=3&\(currentPage)"
    }
}
