import Foundation

class UsersListPresenter {
    var searchedUsers: [UserModel]?
    var repositoryAPI = RepositoryAPI()
    var view: ViewController?
    
    func getSearchedUsers(_ searchedUser: String){
        repositoryAPI.fetchUsersFromAPI(searchedUser) { (users) in
            self.view?.setElements(users)
        }
    }
}
