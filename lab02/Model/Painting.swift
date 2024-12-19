import Foundation

struct Painting: Codable, Identifiable, Hashable {
    let id: String
    let painting: String
    let artist: String
    let technique: String
    let image: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case painting = "Painting"
        case artist = "Artist"
        case technique = "Technique"
        case image = "Image"
        case description = "Description"
    }
}

struct PaintingResponse: Codable {
    let data: [Painting]
}
