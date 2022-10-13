
import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    public func configureCharacterCell(characterName: String?, characterDescription: String?, imageUrl: URL? ) {
        characterImageView.kf.setImage(with: imageUrl)
        nameLabel.text = characterName ?? ""
        descriptionLabel.text =  characterDescription ?? ""
    }
}

