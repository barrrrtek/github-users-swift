import Foundation

class UserDetailsPresenter {
    private var userRepos: [UserRepo] = []
    private var userDetails = UserDetails(login: "", avatar_url: "", id: 0, followers: 0, public_repos: 0)
    var repositoryAPI = RepositoryAPI()
    var view: UserDetailsViewController?
    var currentPage: Int = 1
    
    func getUserDetailsFromAPI(_ userID: Int){
        repositoryAPI.fetchUserDetailsFromAPI(userID) { (userDetails) in
            self.view?.setUserDetails(userDetails)
        }
    }
    
    func getUserReposFromAPI(_ userID: Int){
        currentPage = 1
        repositoryAPI.fetchUserReposFromAPI(userID, currentPage) { (repos) in
            self.view?.setUserRepos(repos)
        }
    }
    
    func getMoreUserReposFromAPI(_ userID: Int){
        self.currentPage += 1
        repositoryAPI.fetchUserReposFromAPI(userID, currentPage) { (repos) in
            self.view?.setMoreUserRepos(repos)
        }
    }
}
