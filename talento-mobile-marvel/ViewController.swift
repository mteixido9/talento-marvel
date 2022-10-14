//
//  ViewController.swift
//  talento-mobile-marvel
//
//  Created by Marc  Teixidó Carrera on 10/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let charactersViewModel = MarvelCharactersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startService()
        setDelegates()
    }
    
    private func startService(){
       // activityIndicator.startAnimating()
        charactersViewModel.retrieveCharacters {
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
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
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
            detailVc.descriptionText = charactersList[indexPath.row].description ?? ""
            present(detailVc, animated: true)
        }
        
    }
    

}


