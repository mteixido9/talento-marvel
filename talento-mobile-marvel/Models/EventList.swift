
import Foundation

struct EventList: Decodable {
    
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [EventSummary]?
    
    public init(available: Int?, returned: Int?, collectionURI: String?, items: [EventSummary]?){
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
