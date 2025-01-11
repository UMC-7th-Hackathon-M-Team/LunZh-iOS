//
//  GameResponseDtop.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import Foundation

public struct GameResponsesDTO : Decodable {
    public let game : String
}

public struct GameResultResponsesDTO : Decodable {
    public let winningFood : String
    public let gameMemberList : [GameMember]
}

public struct GameMember: Decodable {
    public let memberName: String
    public let result: Int
    public let memberFood: String
}
