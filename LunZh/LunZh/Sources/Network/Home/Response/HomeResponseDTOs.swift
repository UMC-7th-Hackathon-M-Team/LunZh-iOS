
import Foundation

public struct HomeInfoResponseDTO : Decodable {
    public let username : String?
    public let role : String?
    public let isFirst : Bool
    public let id: Int
}

public struct CalendarInfoResponseDTO : Codable {
    let id : Int
    let name : String
    let username : String
    let role: String
    let isNewBie : Bool?
    let isFirst : Bool
    let monthPriceMax : Int
    let wineSort : [String]
    let wineArea : [String]
    let region : String
}
