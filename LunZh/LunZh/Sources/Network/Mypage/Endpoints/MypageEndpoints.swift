//
//import Foundation
//import Moya
//
//public enum MypageEndpoints {
//    case getUserInfo
//    case patchNickname
//    case patchTaste
//}
//
//extension MypageEndpoints: TargetType {
//    public var baseURL: URL {
//        guard let url = URL(string: API.baseURL) else {
//            fatalError("잘못된 URL")
//        }
//        return url
//    }
//     
//    //TODO: path 수정
//    public var path: String {
//        switch self {
//        case .getUserInfo:
//            return "/login"
//        case .patchNickname:
//            return "/login"
//        case .patchTaste:
//            return "/members"
//        }
//    }
//    
//    public var method: Moya.Method {
//        switch self {
//        case .getUserInfo:
//            return .get
//        case .patchNickname, .patchTaste:
//            return .patch
//        }
//    }
//    
//    public var task: Task {
//        switch self {
//        case .getUserInfo:
//            return .requestPlain
//        case .patchNickname:
//            return .requestPlain
//        case .patchTaste:
//            return .requestParameters(
//                parameters: ["email": email],  // 쿼리 파라미터
//                encoding: URLEncoding.queryString
//            )
//        }
//    }
//    
//    public var headers: [String : String]? {
//        var headers: [String: String] = [
//            "Content-type": "application/json"
//        ]
//        
//        return headers
//    }
//
//}
