//
//  ViewController.swift
//  talento-mobile-marvel
//
//  Created by Marc  Teixidó Carrera on 10/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    let marvelCharactersViewModel = MarvelCharactersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        marvelCharactersViewModel.retrieveCharacters(page: 1) {
            
        }

        // Do any additional setup after loading the view.
    }


}

