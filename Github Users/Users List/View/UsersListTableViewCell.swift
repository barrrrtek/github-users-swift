import UIKit

class UsersListTableViewCell: UITableViewCell {
    @IBOutlet weak var imgUserAvatar: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUserAvatar.layer.cornerRadius = 10.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
