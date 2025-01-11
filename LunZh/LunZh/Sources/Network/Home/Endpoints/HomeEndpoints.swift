
import Foundation
import Moya

public enum HomeEndpoints {
    case getHomeInfo(userId: Int)
    case getCalendarInfo(userId: Int)
}

extension HomeEndpoints: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: API.baseURL) else {
            fatalError("잘못된 URL")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .getHomeInfo(let userId):
            return "/home/\(userId)"
        case .getCalendarInfo(let userId):
            return "/calendar/\(userId)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .getHomeInfo(let data):
            return .requestPlain
        case .getCalendarInfo(let data):
            return .requestJSONEncodable(data)
        }
    }
    
    public var headers: [String : String]? {
        var headers: [String: String] = [
            "Content-type": "application/json"
        ]
        
        return headers
    }

}
