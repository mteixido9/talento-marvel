
import Foundation

struct Image: Decodable{
    let path: String?
    let ext: String?
    
    public init(path: String?, ext: String?){
        self.path = path
        self.ext = ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
