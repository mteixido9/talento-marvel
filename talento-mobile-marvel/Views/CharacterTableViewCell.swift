
import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    public func configureCharacterCell(characterName: String?, characterDescription: String?, imageUrl: URL? ) {
        characterImageView.kf.setImage(with: imageUrl)
        nameLabel.text = characterName ?? ""
        setupNameLabelCornerRadius()
    }
    
    private func setupNameLabelCornerRadius(){
        nameLabel.layer.cornerRadius = 12
        nameLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        nameLabel.layer.masksToBounds = true
    }
}

