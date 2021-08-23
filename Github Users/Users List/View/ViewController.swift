import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBart: UISearchBar!
    @IBAction func searchButton(_ sender: UIButton) {
        //let searchedUsername: String = searchBart.text!
    }
    
    private var usersListPresenter = UsersListPresenter()
    private var usersList: Array<UserModel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        usersList = usersListPresenter.getSearchedUsers()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return usersList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
//
//        cell.textLabel!.text = usersList[indexPath.row].username;
//
//        return cell;
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return usersList.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.imageUserAvatar.image = UIImage(named: "mock_avatar")
        cell.labelUsername.text = usersList[indexPath.row].username

        return cell
    }
}
