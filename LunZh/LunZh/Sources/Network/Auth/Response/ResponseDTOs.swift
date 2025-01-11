import Foundation

public struct LoginResponseDTO : Decodable {
    public let id : Int
    public let email : String
    public let isFirstLogin : Bool
    public let foodPrefer : [String]?
}
