import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var usersListPresenter = UsersListPresenter()
    private var usersList: Array<UserModel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        usersList = usersListPresenter.getSearchedUsers()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBart: UISearchBar!
    @IBAction func searchButton(_ sender: UIButton) {
        //let searchedUsername: String = searchBart.text!
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);

        cell.textLabel!.text = usersList[indexPath.row].username;
        
        return cell;
    }
}
