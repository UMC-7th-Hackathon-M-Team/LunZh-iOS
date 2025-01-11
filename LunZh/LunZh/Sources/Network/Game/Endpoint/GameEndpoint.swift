//
//  GameEndpoint.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import Foundation
import Moya

public enum GameEndpoint {
    case gameStart(teamId: Int, memeberId: Int)
    case gameResult(teamId: Int, memeberId: Int, data: GameRequestDTO)
    case getTotalResult(teamId: Int)
}

extension GameEndpoint: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: API.gameURL) else {
            fatalError("잘못된 URL")
        }
        return url
    }
    
    public  var path: String {
        switch self {
        case .gameStart(let teamId, let memberId):
            return "/\(teamId)/\(memberId)"
        case .gameResult(let teamId, let memberId, let data):
            return "/result/\(teamId)/\(memberId)"
        case .getTotalResult(let teamId):
            return "/team-result/\(teamId)"
        default:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .gameStart, .getTotalResult:
            return .get
        case .gameResult:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .gameStart:
            return .requestPlain
        case .getTotalResult(let data):
            return .requestJSONEncodable(data)
        case .gameResult(let teamId, let memberId, let data):
            return .requestJSONEncodable(data)
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-type": "application/json"
        ]
    }
}
