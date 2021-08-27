import Foundation

class UsersListPresenter {
    private var searchedUsers: Array<UserModel> = []
    var repositoryMock = RepositoryMock()
    
    func getSearchedUsers(_ searchedUser: String) -> [UserModel]{
        searchedUsers.removeAll()
        searchedUsers = repositoryMock.listOfUsers.filter({($0.username?.lowercased().contains(searchedUser.lowercased()))!})
        return searchedUsers
    }
}
