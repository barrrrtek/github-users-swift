import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var imgUserAvatar: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblUserInfo: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowersCount: UILabel!
    @IBOutlet weak var lblRepositories: UILabel!
    @IBOutlet weak var lblRepositoriesCount: UILabel!
    @IBOutlet weak var lblRepositoriesList: UILabel!
    @IBOutlet weak var tableViewReposList: UITableView!
    var userId: Int?
    let userDetailsPresenter = UserDetailsPresenter()
    let userRepoCellId = "UserRepoTableViewCell"
    var userReposList: [UserRepo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userReposList = []//userDetailsPresenter.getUserReposMock(userId!)
        let userDetails: UserDetails = userDetailsPresenter.getUserDetailsFromAPI(userId!)
        //let imageUrl:URL = URL(string: userDetails.avatar_url)!
        //cell.imgUserAvatar.loadImge(withUrl: imageUrl)
        imgUserAvatar.image = UIImage(named: "mock_avatar")
        imgUserAvatar.layer.cornerRadius = 10.0
        lblUsername.text = userDetails.login
        lblFollowersCount.text = String(describing: userDetails.followers)
        lblRepositoriesCount.text = String(describing: userDetails.public_repos)
        tableViewReposList.dataSource = self
        tableViewReposList.delegate = self
        tableViewReposList.rowHeight = 95.0//UITableView.automaticDimension
        tableViewReposList.separatorColor = UIColor.clear
        tableViewReposList.register(UINib.init(nibName: userRepoCellId, bundle: nil), forCellReuseIdentifier: userRepoCellId)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userReposList?.count ?? 0
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewReposList.dequeueReusableCell(withIdentifier: userRepoCellId, for: indexPath) as! UserRepoTableViewCell
        let _ = userReposList?[indexPath.row]
        cell.lblRepoName.text = ""//repo.name
        cell.lblRepoURL.text = ""//repo.url
        cell.lblStarsCount.text = ""//String(describing: repo.stars)
        return cell
    }
}
