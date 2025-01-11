import Foundation

public struct LoginResponseDTO : Decodable {
    public let nickname : String
    public let favoriteFoods : [String]
}
