

import Foundation

class MarvelCharactersViewModel {
    var charactersLoaded: (([Character]?, Bool) -> Void)?
    var charactersList: [Character]?
    var charactersListPage: Int = 1
    let limit: Int = 20
    
    func retrieveCharacters(pagination: Bool = false, page: Int? = nil, limit:Int? = nil, _ completionHandler:@escaping (()-> Void)) {
        
        MarvelApiManager.shared.retrieveCharacters(page: page, limit: limit, success: { [self] response in
            self.charactersListPage = self.charactersListPage + response.data!.count!
            if(pagination){
                DispatchQueue.main.async {
                    self.charactersList?.append(contentsOf: (response.data?.results)!)
                    self.handleResponse(response: response.data?.results, success: true)
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
    
    private func handleResponse(response: [Character]?, success: Bool) {
        if let charactersLoaded = self.charactersLoaded {
            charactersLoaded(response, success)
        }
    }
    
    func numberOrRows() -> Int {
        return self.charactersList?.count ?? 0
    }
    
    func getCharacter(index: Int) -> Character? {
        return self.charactersList?[index]
    }
}
