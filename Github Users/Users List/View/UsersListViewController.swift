import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var searchBart: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func searchButton(_ sender: UIButton) {
        let _: String = searchBart.text!
        
    }
    
    
}
