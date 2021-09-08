import Foundation

class UserDetailsPresenter {
    private var userRepos: [UserRepo] = []
    private var userDetails = UserDetails(login: "", avatar_url: "", id: 0, followers: 0, public_repos: 0)
    var repositoryMock = RepositoryMock()
    var repositoryAPI = RepositoryAPI()
    var view: UserDetailsViewController?
    
    func getUserDetailsMock(_ id: Int) -> UserDetails{
        let detailsUsersList = repositoryMock.listOfDetailsUsersMock
        var userDetails = UserDetails(login: "", avatar_url: "", id: 0, followers: 0, public_repos: 0)
        userDetails = detailsUsersList.first ?? userDetails
        return userDetails
    }
    
    func getUserReposMock(_ id: Int) -> [UserRepo]{
        userRepos.removeAll()
        userRepos = repositoryMock.userReposListMock
        return userRepos
    }
    
    func getUserDetailsFromAPI(_ userID: Int){
        repositoryAPI.fetchUserDetailsFromAPI(userID) { (userDetails) in
            self.view?.setUserDetails(userDetails)
        }
    }
    
    func getUserReposFromAPI(_ userID: Int){
        repositoryAPI.fetchUserReposFromAPI(userID) { (repos) in
            self.view?.setUserRepos(repos)
        }
    }
    
    func getMoreUserReposFromAPI(_ userID: Int){
        repositoryAPI.currentPage += 1
        repositoryAPI.fetchUserReposFromAPI(userID) { (repos) in
            self.view?.setMoreUserRepos(repos)
        }
    }
}
