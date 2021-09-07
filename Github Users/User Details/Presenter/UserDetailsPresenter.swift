import Foundation

class UserDetailsPresenter {
    private var userRepos: [UserRepo] = []
    //private var userDetails = UserDetails(login: "", avatar_url: "", id: 0, followers: 0, public_repos: 0)
    var repositoryMock = RepositoryMock()
    var repositoryAPI = RepositoryAPI()
    
    func getUserReposMock(_ id: Int) -> [UserRepo]{
        userRepos.removeAll()
        userRepos = repositoryMock.userReposListMock
        return userRepos
    }
    
    func getUserDetailsFromAPI(_ id: Int) -> UserDetails{
        let userDetails: UserDetails = repositoryAPI.fetchUserDetailsFromAPI(id)
        //userDetails = repositoryAPI.userDetails
        print(userDetails)
        return userDetails
    }
}
