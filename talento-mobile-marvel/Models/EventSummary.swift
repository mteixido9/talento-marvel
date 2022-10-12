
import Foundation

struct EventSummary: Decodable{
    
    let resourceURI: String?
    let name: String?
    
    public init(resourceURI: String?, name: String?){
        self.resourceURI = resourceURI
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
    }
}
