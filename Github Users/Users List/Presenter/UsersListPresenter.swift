import Foundation

class UsersListPresenter {
    var searchedUsers: [UserModel]?
    var repositoryMock = RepositoryMock()
    var repositoryAPI = RepositoryAPI()
    var view: ViewController?
    
    
    func getSearchedUsersMock(_ searchedUser: String) -> [UserModel]{
        searchedUsers = repositoryMock.listOfUsersMock.filter({($0.login.lowercased().contains(searchedUser.lowercased()))})
        return searchedUsers ?? []
    }
    
    func getSearchedUsers(_ searchedUser: String){
        repositoryAPI.fetchUsersFromAPI(searchedUser) { (users) in
            self.view?.setElements(users)
        }
    }
}
