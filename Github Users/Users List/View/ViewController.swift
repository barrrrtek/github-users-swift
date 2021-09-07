import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBart: UISearchBar!
    @IBAction func searchButton(_ sender: UIButton) {
        let searchText = searchBart.text
        usersListPresenter.getSearchedUsers(searchText ?? "")
    }
    
    private var usersList: [UserModel] = []
    let usersListCellId = "UsersListTableViewCell"
    private var usersListPresenter = UsersListPresenter()
    private var userDetailsPresenter = UserDetailsPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        tableView.register(UINib.init(nibName: usersListCellId, bundle: nil), forCellReuseIdentifier: usersListCellId)
        self.usersListPresenter.view = self
    }
    
    func setElements(_ elements: [UserModel]) {
        self.usersList = elements
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: usersListCellId, for: indexPath) as! UsersListTableViewCell
        let user = usersList[indexPath.row]
        let imageUrl:URL = URL(string: user.avatar_url) ?? URL(string: "")!
        cell.imgUserAvatar.loadImge(withUrl: imageUrl)
        cell.lblUsername.text = user.login
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "UserDetails", bundle: nil)
        let controller = story.instantiateViewController(identifier: "UserDetailsViewController") as! UserDetailsViewController
        let user = usersList[indexPath.row]
        controller.userID = user.id
        self.present(controller, animated: true, completion: nil)
    }
}

extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
}
