import Foundation

class RepositoryMock {
    let listOfUsersMock: [UserModel] = [
        UserModel(login: "Bartek", avatar_url: "", id: 1),
        UserModel(login: "Adrian", avatar_url: "", id: 2),
        UserModel(login: "Kuba", avatar_url: "", id: 3),
        UserModel(login: "Bartek2", avatar_url: "", id: 4),
        UserModel(login: "Adrian2", avatar_url: "", id: 5),
        UserModel(login: "Kuba2", avatar_url: "", id: 6)
    ]
    
    let listOfDetailsUsersMock: [UserDetails] = [
        UserDetails(login: "Bartek", avatar_url: "", id: 1, followers: 12, public_repos: 2),
        UserDetails(login: "Adrian", avatar_url: "", id: 2, followers: 32, public_repos: 2),
        UserDetails(login: "Kuba", avatar_url: "", id: 3, followers: 4, public_repos: 2),
        UserDetails(login: "Bartek2", avatar_url: "", id: 4, followers: 645, public_repos: 2),
        UserDetails(login: "Adrian2", avatar_url: "", id: 5, followers: 21, public_repos: 2),
        UserDetails(login: "Kuba2", avatar_url: "", id: 6, followers: 1, public_repos: 2)
    ]

    let userReposListMock: [UserRepo] = [
        UserRepo(name: "repo1", html_url: "https://reposandjijqw", id: 1, stargazers_count: 4),
        UserRepo(name: "repo2", html_url: "https://reposdsad", id: 2, stargazers_count: 32),
        UserRepo(name: "repo3", html_url: "https://reposdsad", id: 3, stargazers_count: 12),
        UserRepo(name: "repo4", html_url: "https://reposdsad", id: 4, stargazers_count: 22),
        UserRepo(name: "repo5", html_url: "https://reposandjijqw", id: 5, stargazers_count: 34),
        UserRepo(name: "repo6", html_url: "https://reposdsad", id: 6, stargazers_count: 72),
        UserRepo(name: "repo7", html_url: "https://reposdsad", id: 7, stargazers_count: 3),
        UserRepo(name: "repo8", html_url: "https://reposdsad", id: 8, stargazers_count: 52),
        UserRepo(name: "repo9", html_url: "https://reposandjijqw", id: 9, stargazers_count: 31),
        UserRepo(name: "repo10", html_url: "https://reposdsad", id: 10, stargazers_count: 19),
        UserRepo(name: "repo11", html_url: "https://reposdsad", id: 11, stargazers_count: 14),
        UserRepo(name: "repo12", html_url: "https://reposdsad", id: 12, stargazers_count: 1)
    ]
}
