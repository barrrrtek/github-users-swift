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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDetails: UserDetails = userDetailsPresenter.getUserDetails(userId!)
        imgUserAvatar.image = UIImage(named: "mock_avatar")
        lblUsername.text = userDetails.username
        lblFollowersCount.text = String(describing: userDetails.followersCount!)
        lblRepositoriesCount.text = String(describing: userDetails.repositoriesCount!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
