//
//  ViewController.swift
//  talento-mobile-marvel
//
//  Created by Marc  Teixidó Carrera on 10/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let marvelCharactersViewModel = MarvelCharactersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startService()
        setDelegates()
    }
    
    private func startService(){
       // activityIndicator.startAnimating()
        marvelCharactersViewModel.retrieveCharacters {
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
        marvelCharactersViewModel.numberOrRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        guard let charactersList = marvelCharactersViewModel.charactersList else { return characterCell }
        DispatchQueue.main.async {
            characterCell.configureCharacterCell(characterName: charactersList[indexPath.row].name, characterDescription: charactersList[indexPath.row].description, imageUrl: charactersList[indexPath.row].thumbnail?.url )
        }
        return characterCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let detailVc = storyboard?.instantiateViewController(withIdentifier: "BeerDetailViewController") as? BeerDetailViewController{
//            guard let beerList = beersViewModel.beerList else { return  }
//            detailVc.image = beerList[indexPath.row].imageUrl ?? ""
//            detailVc.name = beerList[indexPath.row].name ?? ""
//            detailVc.tag = beerList[indexPath.row].tagline ?? ""
//            detailVc.descriptionText = beerList[indexPath.row].description ?? ""
//            detailVc.abv = beerList[indexPath.row].abv ?? 0
//            detailVc.ibu = beerList[indexPath.row].ibu ?? 0
//            detailVc.matchingFood = beerList[indexPath.row].foodPairing?.joined(separator: ", ") ?? ""
//            self.navigationController?.pushViewController(detailVc, animated: true)
//        }
    }
    


}

