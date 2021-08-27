import Foundation

class UserDetailsPresenter {
    private var userRepos: [UserRepo] = []
    private var userDetails = UserDetails(username: "", avatarURL: "", id: 0, followersCount: 0, repositoriesCount: 0)
    var repositoryMock = RepositoryMock()
    
    func getUserDetails(_ id: Int) -> UserDetails{
        let detailsUsersList = repositoryMock.listOfDetailsUsers.filter({$0.id == id})
        userDetails = detailsUsersList[0]
        return userDetails
    }
    
    func getUserRepos(_ id: Int) -> [UserRepo]{
        userRepos.removeAll()
        userRepos = repositoryMock.userReposList.filter({$0.userId == id})
        return userRepos
    }
}
