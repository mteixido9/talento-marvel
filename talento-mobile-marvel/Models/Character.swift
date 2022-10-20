
import Foundation

struct Character: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
    let series: SeriesList?
    let stories: StoryList?
    let events: EventList?
    
    public init(id: Int?, name: String?, description: String?, thumbnail: Image?, comics: ComicList?, series: SeriesList?, stories: StoryList?, events: EventList? ){
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case series
        case stories
        case events
    }
}
