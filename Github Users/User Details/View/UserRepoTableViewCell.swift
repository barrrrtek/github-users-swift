import UIKit

class UserRepoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblRepoURL: UILabel!
    @IBOutlet weak var lblRepoStars: UILabel!
    @IBOutlet weak var lblStarsCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
