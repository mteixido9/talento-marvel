
import UIKit
import Kingfisher

class ComicTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    public func configureComicCell(comicName: String?) {
        nameLabel.text = comicName ?? ""
    }
}

