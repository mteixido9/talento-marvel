import Foundation
import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicsTableView: UITableView!
    @IBOutlet weak var comicsTableViewHeight: NSLayoutConstraint!
    
    var image: URL?
    var name = ""
    var tag = ""
    var descriptionText = ""
    var abv: Double = 0
    var ibu: Double = 0
    var matchingFood = ""
    var comicsList : [ComicSummary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
        setupDelegates()
        setupComicsHeader()
        setupTableViewHeight()
    }
    
    func setupDetailView() {
        characterImageView.kf.setImage(with: image)
        nameLabel.text = name
        descriptionLabel.text =  descriptionText
    }
    
    private func setupDelegates(){
        self.comicsTableView.delegate = self
        self.comicsTableView.dataSource = self
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comicsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comicCell = tableView.dequeueReusableCell(withIdentifier: "ComicTableViewCell", for: indexPath) as! ComicTableViewCell
        guard let comicsList = comicsList else { return comicCell }
        DispatchQueue.main.async {
            comicCell.configureComicCell(comicName: comicsList[indexPath.row].name ?? "")
        }
        return comicCell
    }
    
    private func setupComicsHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        header.backgroundColor = .red
        comicsTableView.tableHeaderView = header
        let label = UILabel(frame: header.bounds)
        label.text = "Comics"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = NSTextAlignment(.center)
        header.addSubview(label)
    }
    
    private func setupTableViewHeight(){
        comicsTableViewHeight.constant = CGFloat(43.5 * Double(comicsList?.count ?? 1) + 40)
    }
    
}
