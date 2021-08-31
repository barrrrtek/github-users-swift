import Foundation

class RepositoryAPI {
    var usersList: [UserModel] = []
    var userDetailsJSON: [UserDetails] = []
    var reposJSON: [UserRepo] = []
    let currentPage = 1
    
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
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: json!["items"]!, options: [])
            {
                do {
                    let decodedData = try JSONDecoder().decode([UserModel].self, from: jsonData)
                    self.usersList = decodedData
                } catch {
                    print("ERROR:", error.localizedDescription)
                }
            }
        })
        task.resume()
    }
    
    func fetchUserDetailsFromAPI(_ userId: Int) {
        let url = URL(string: "https://api.github.com/user/\(userId)")!
    }
    
    func fetchUserReposFromAPI(_ userId: Int, _ currentPage: Int) {
        let url = URL(string: "https://api.github.com/user/\(userId)/repos?per_page=3&\(currentPage)")!
    }
}
