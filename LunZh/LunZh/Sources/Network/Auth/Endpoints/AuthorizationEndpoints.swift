
import Foundation
import Moya

public enum AuthorizationEndpoints {
    case postLogin(data : LoginDTO)
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
        case .postLogin:
            return "/login"
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
        case .postLogin(let data):
            return .requestJSONEncodable(data)
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
