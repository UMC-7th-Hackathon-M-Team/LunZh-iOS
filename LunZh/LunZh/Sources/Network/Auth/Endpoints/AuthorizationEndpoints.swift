
import Foundation
import Moya

public enum AuthorizationEndpoints {
    case postLogin(email: String)
    case postLogout
    case postDelete
}

extension AuthorizationEndpoints: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: API.baseURL) else {
            fatalError("잘못된 URL")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .postLogin(let email):
            return "/members/login"
        case .postDelete:
            return "/login"
        case .postLogout:
            return "/logout"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .postLogin(let email):
            return .requestParameters(
                parameters: ["email": email],  // 쿼리 파라미터
                encoding: URLEncoding.queryString
            )
        case .postLogout, .postDelete:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        var headers: [String: String] = [
            "Content-type": "application/json"
        ]
        
        return headers
    }

}
