import Foundation

class RepositoryAPI {
    let baseURL: String = "https://api.github.com/"
    let session = URLSession.shared
    
    func fetchUsersFromAPI(_ searchedText: String, completionHandler: @escaping ([UserModel]) -> Void) {
        let url = URL(string: "\(baseURL)search/users?q=\(searchedText.lowercased())&per_page=100")!
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Client error!")
                return
            }
            
            guard let data = data else {
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
                let decodedData = try JSONDecoder().decode(UsersResposne.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(decodedData.items)
                }
            } catch {
                print("ERROR:", error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchUserDetailsFromAPI(_ userID: Int, completionHandler: @escaping (UserDetails) -> Void) {
        let url = URL(string: "\(baseURL)user/\(userID)")!
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Client error!")
                return
            }
            
            guard let data = data else {
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
                let decodedData = try JSONDecoder().decode(UserDetails.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(decodedData)
                }
            } catch {
                print("ERROR:", error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchUserReposFromAPI(_ userID: Int, _ currentPage: Int, completionHandler: @escaping ([UserRepo]) -> Void) {
        let url = URL(string: "\(baseURL)user/\(userID)/repos?per_page=3&\(currentPage)")!
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Client error!")
                return
            }
            
            guard let data = data else {
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
                let decodedData = try JSONDecoder().decode([UserRepo].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(decodedData)
                }
            } catch {
                print("ERROR:", error.localizedDescription)
            }
        }.resume()
    }
}
