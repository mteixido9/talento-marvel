

import Foundation

class MarvelCharactersViewModel {
    var charactersLoaded: (([Character]?, Bool) -> Void)?
    var charactersList: [Character]?
    //var randomBeer: Beer?
   // var beerListPage: Int = 1
    
    func retrieveCharacters(pagination: Bool = false, page: Int? = nil, _ completionHandler:@escaping (()-> Void)) {
        MarvelApiManager.shared.retrieveCharacters(page: page, success: { response in
            if(pagination){
                DispatchQueue.main.async {
                    self.charactersList?.append(contentsOf: (response.data?.results)!)
                    self.handleResponse(response: response.data?.results, success: true)
                   // self.beerListPage+=1
                    completionHandler()
                }
                return
            }
            self.charactersList = response.data?.results
            self.handleResponse(response: response.data?.results, success: true)
            completionHandler()
        }, fail: { [weak self] in
            self?.handleResponse(response: nil, success: false)
            
        })
    }
    
//    func retrieveBeersBy(foodName: String, _ completionHandler:@escaping (()-> Void)){
//        BeerApiManager.shared.getBeerFor(food: foodName) { [weak self] response in
//            self?.beerList = response
//            self?.handleResponse(response: response, success: true)
//            completionHandler()
//        } fail: { [weak self] in
//            self?.handleResponse(response: nil, success: false)
//        }
//    }
//
//    func getRandomBeer(_ completionHandler:@escaping (()-> Void)){
//        BeerApiManager.shared.getRandomBeer(success: { [weak self] response in
//            self?.randomBeer = response.first
//            self?.handleResponse(response: response, success: true)
//            completionHandler()
//        }, fail: { [weak self] in
//            self?.handleResponse(response: nil, success: false)
//        })
//    }
    
    private func handleResponse(response: [Character]?, success: Bool) {
        if let charactersLoaded = self.charactersLoaded {
            charactersLoaded(response, success)
        }
    }
    
    func numberOrRows() -> Int {
        return self.charactersList?.count ?? 0
    }
    
    func getBeer(index: Int) -> Character? {
        return self.charactersList?[index]
    }
}
