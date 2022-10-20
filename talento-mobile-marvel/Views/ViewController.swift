
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let charactersViewModel = MarvelCharactersViewModel()
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        startService()
        setDelegates()
    }
    
    private func startService(){
        // activityIndicator.startAnimating()
        charactersViewModel.retrieveCharacters{
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
                //activityIndicator.stopAnimating()
            }
        }
    }
    
    private func setDelegates() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charactersViewModel.numberOrRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        guard let charactersList = charactersViewModel.charactersList else { return characterCell }
        DispatchQueue.main.async {
            characterCell.configureCharacterCell(characterName: charactersList[indexPath.row].name, characterDescription: charactersList[indexPath.row].description, imageUrl: charactersList[indexPath.row].thumbnail?.url )
        }
        return characterCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVc = storyboard?.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController{
            guard let charactersList = charactersViewModel.charactersList else { return }
            detailVc.image = charactersList[indexPath.row].thumbnail?.url
            detailVc.name = charactersList[indexPath.row].name ?? ""
            detailVc.comicsList = charactersList[indexPath.row].comics?.items
            detailVc.descriptionText = charactersList[indexPath.row].description ?? ""
            present(detailVc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height-100-scrollView.frame.size.height{
            //activityIndicator.startAnimating()
            if !isLoading {
                isLoading = true
                charactersViewModel.retrieveCharacters(pagination: true, page: charactersViewModel.charactersListPage, limit: charactersViewModel.limit) {
                    
                    DispatchQueue.main.async { [self] in
                        isLoading = false
                        tableView.reloadData()
                        //activityIndicator.stopAnimating()
                    }
                }
            }
            
        }
    }
}


