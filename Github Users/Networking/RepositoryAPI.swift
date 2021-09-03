import Foundation

class RepositoryAPI {
    var usersList: [UserModel] = []
    var userDetails: UserDetails = UserDetails(login: "", avatar_url: "", id: 0, followers: 0, public_repos: 0)
    var reposList: [UserRepo] = []
    let currentPage = 1
    
    func fetchUsersFromAPI(_ searchedText: String) {
        let session = URLSession.shared
        let url = URL(string: "https://api.github.com/search/users?q=\(searchedText.lowercased())&per_page=100")!
        session.dataTask(with: url, completionHandler: { data, response, error in
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
        }).resume()
    }
    
    func fetchUserDetailsFromAPI(_ userId: Int) {
        let session = URLSession.shared
        let url = URL(string: "https://api.github.com/user/\(userId)")!
        session.dataTask(with: url, completionHandler: { [self] data, response, error in
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
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: json!, options: [])
            {
                do {
                    let decodedData = try JSONDecoder().decode(UserDetails.self, from: jsonData)
                    self.userDetails = decodedData
                    //print(self.userDetails)
                } catch {
                    print("ERROR:", error.localizedDescription)
                }
            }
        }).resume()
    }
    
    func fetchUserReposFromAPI(_ userId: Int, _ currentPage: Int) {
        let session = URLSession.shared
        let url = URL(string: "https://api.github.com/user/\(userId)/repos?per_page=3&\(currentPage)")!
        session.dataTask(with: url, completionHandler: { data, response, error in
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
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: json!, options: [])
            {
                do {
                    let decodedData = try JSONDecoder().decode([UserRepo].self, from: jsonData)
                    self.reposList = decodedData
                } catch {
                    print("ERROR:", error.localizedDescription)
                }
            }
        }).resume()
    }
}
