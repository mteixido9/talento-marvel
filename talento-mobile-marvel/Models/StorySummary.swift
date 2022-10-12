
import Foundation

struct StorySummary: Decodable {
    
    let resourceURI: String?
    let name: String?
    let type: String?
    
    public init(resourceURI: String?, name: String?, type: String?){
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
    
    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
        case type
    }
}
