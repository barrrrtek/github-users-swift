import Foundation

class UsersListPresenter {
    private var searchedUsers: [UserModel] = []
    var repositoryMock = RepositoryMock()
    var repositoryAPI = RepositoryAPI()
    
    func getSearchedUsersMock(_ searchedUser: String) -> [UserModel]{
        searchedUsers.removeAll()
        searchedUsers = repositoryMock.listOfUsers.filter({($0.login.lowercased().contains(searchedUser.lowercased()))})
        return searchedUsers
    }
    
    func getSearchedUsers(_ searchedUser: String) -> [UserModel]{
        searchedUsers.removeAll()
        repositoryAPI.fetchUsersFromAPI(searchedUser)
        searchedUsers = repositoryAPI.usersList
        return searchedUsers
    }
}
