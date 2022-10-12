
import Foundation

struct SeriesList: Decodable {
    
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [SeriesSummary]?
    
    public init(available: Int?, returned: Int?, collectionURI: String?, items: [SeriesSummary]?){
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
    
    enum CodingKeys: String, CodingKey {
        case available
        case returned
        case collectionURI
        case items
    }
}
