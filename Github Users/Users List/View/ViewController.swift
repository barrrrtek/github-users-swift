import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBart: UISearchBar!
    @IBAction func searchButton(_ sender: UIButton) {
        
    }
    let usersListCellId = "UsersListTableViewCell"
    
    private var usersListPresenter = UsersListPresenter()
    private var usersList: Array<UserModel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib.init(nibName: usersListCellId, bundle: nil), forCellReuseIdentifier: usersListCellId)
        
        usersList = usersListPresenter.getSearchedUsers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: usersListCellId, for: indexPath) as! UsersListTableViewCell
        let user = usersList[indexPath.row]
        cell.imgUserAvatar.image = UIImage(named: "mock_avatar")
        cell.lblUsername.text = user.username!

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\(indexPath.row)")
    }
}
