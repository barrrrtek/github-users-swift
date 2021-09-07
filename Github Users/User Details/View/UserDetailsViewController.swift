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
    let userDetailsPresenter = UserDetailsPresenter()
    let userRepoCellId = "UserRepoTableViewCell"
    var userReposList: [UserRepo]?
    var userID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewElements()
        initTableViewReposList()
        self.userDetailsPresenter.view = self
    }
    
    func initViewElements() {
        userDetailsPresenter.getUserDetailsFromAPI(userID ?? 0)
        userDetailsPresenter.getUserReposFromAPI(userID ?? 0)
    }
    
    func initTableViewReposList() {
        tableViewReposList.dataSource = self
        tableViewReposList.delegate = self
        tableViewReposList.rowHeight = 95.0
        tableViewReposList.separatorColor = UIColor.clear
        tableViewReposList.register(UINib.init(nibName: userRepoCellId, bundle: nil), forCellReuseIdentifier: userRepoCellId)
    }
    
    func setUserDetails(_ userDetails: UserDetails) {
        let imageUrl:URL = URL(string: userDetails.avatar_url) ?? URL(string: "")!
        self.imgUserAvatar.loadImge(withUrl: imageUrl)
        self.imgUserAvatar.layer.cornerRadius = 10.0
        self.lblUsername.text = userDetails.login
        self.lblFollowersCount.text = String(describing: userDetails.followers)
        self.lblRepositoriesCount.text = String(describing: userDetails.public_repos)
    }
    
    func setUserRepos(_ userRepos: [UserRepo]) {
        userReposList = userRepos
        self.tableViewReposList.reloadData()
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
        let repo = userReposList?[indexPath.row]
        cell.lblRepoName.text = repo?.name
        cell.lblRepoURL.text = repo?.html_url
        cell.lblStarsCount.text = String(describing: repo?.stargazers_count)
        return cell
    }
}
