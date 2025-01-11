
import Foundation

public struct HomeInfoResponseDTO : Decodable {
    public let memberName : String?
    public let hasGroup : Bool
    public let groupName : String?
}

public struct CalendarInfoResponseDTO : Codable {
    let date : String
    let food : String
}
