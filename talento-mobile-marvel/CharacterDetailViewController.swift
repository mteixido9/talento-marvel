import Foundation
import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {
        
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var image: URL?
    var name = ""
    var tag = ""
    var descriptionText = ""
    var abv: Double = 0
    var ibu: Double = 0
    var matchingFood = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
    }

    func setupDetailView() {
        characterImageView.kf.setImage(with: image)
        nameLabel.text = name
        descriptionLabel.text =  descriptionText
    }
}
