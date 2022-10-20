import Foundation

class MarvelApiManager {
    public static let shared = MarvelApiManager()
    private let API_KEY = "6fb7a929cdb829d71f538876e413a19b"
    private let timestamp = "\(Date().timeIntervalSince1970)"
    private let PRIVATE_KEY = "2ae442cd847b60921c5c750ad45063c54ad65f82"
    
    func retrieveCharacters(page: Int?, limit: Int?, success:@escaping ((CharacterDataWrapper)-> Void), fail: @escaping (()-> Void)) {
        let hash = "\(timestamp)\(PRIVATE_KEY)\(API_KEY)".md5
        let offset = (page ?? 0) * (limit ?? 20)
        
        ServiceManager.shared.callService(urlString: "https://gateway.marvel.com:443/v1/public/characters?&offset=\(offset)&limit=\(limit ?? 20)&ts=\(timestamp)&apikey=\(API_KEY)&hash=\(hash)") {response in
            success(response)
        } fail: {
            fail()
        }
    }
}

