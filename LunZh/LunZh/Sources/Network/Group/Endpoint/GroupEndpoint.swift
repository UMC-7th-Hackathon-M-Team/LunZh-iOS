//
//  GroupEndpoint.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import Foundation
import Moya

public enum GroupEndpoints {
    case postGroup(email: String, name: String)
    case exitGroup(memberId: Int)
    case joinGroup(memberId: Int, teamCode: Int)
}

extension GroupEndpoints: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: API.groupURL) else {
            fatalError("잘못된 URL")
        }
        return url
    }
    
    public  var path: String {
        switch self {
        case .postGroup(let email, let name):
            return ""
        case .exitGroup(let memberId):
            return "/exit"
        case .joinGroup(let memberId, let teamCode):
            return ""
        default:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .postGroup, .joinGroup, .exitGroup:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .postGroup(let email, let name):
            return .requestParameters(
                parameters: ["email": email, "name": name],  // 쿼리 파라미터
                encoding: URLEncoding.queryString
            )
        case .exitGroup(let memberId):
            return .requestParameters(
                parameters: ["memberId": memberId],  // 쿼리 파라미터
                encoding: URLEncoding.queryString
            )
        case .joinGroup(let memberId, let teamCode):
            return .requestParameters(
                parameters: ["memberId": memberId, "teamCode": teamCode],  // 쿼리 파라미터
                encoding: URLEncoding.queryString
            )
        }
        
    }
    
    public var headers: [String : String]? {
        return [
            "Content-type": "application/json"
        ]
    }
    
}
