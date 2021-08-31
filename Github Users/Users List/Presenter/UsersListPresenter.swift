import Foundation

class UsersListPresenter {
    private var searchedUsersMock: Array<UserModel> = []
    var repositoryMock = RepositoryMock()
    
    func getSearchedUsersMock(_ searchedUser: String) -> [UserModel]{
        searchedUsersMock.removeAll()
        searchedUsersMock = repositoryMock.listOfUsers.filter({($0.login.lowercased().contains(searchedUser.lowercased()))})
        return searchedUsersMock
    }
}
