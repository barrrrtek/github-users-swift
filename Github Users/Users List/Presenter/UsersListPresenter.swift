import Foundation

class UsersListPresenter {
    private var searchedUsers: Array<UserModel> = []
    private var listOfUsers: Array<UserModel> = [
        UserModel(username: "Bartek", avatarURL: "", id: 1),
        UserModel(username: "Adrian", avatarURL: "", id: 2),
        UserModel(username: "Kuba", avatarURL: "", id: 3),
        UserModel(username: "Bartek2", avatarURL: "", id: 4),
        UserModel(username: "Adrian2", avatarURL: "", id: 5),
        UserModel(username: "Kuba2", avatarURL: "", id: 6)
    ]
    
    func getSearchedUsers(/*searchedUser: String*/) -> Array<UserModel>{
        //searchedUsers.removeAll()
        //return searchedUsers
        return listOfUsers
    }
}
