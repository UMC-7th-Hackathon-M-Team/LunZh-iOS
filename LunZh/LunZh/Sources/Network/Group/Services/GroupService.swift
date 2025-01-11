
import Foundation
import Moya

public final class GroupService : NetworkManager {
    typealias Endpoint = GroupEndpoints
    
    // MARK: - Provider 설정
    let provider: MoyaProvider<GroupEndpoints>
    
    public init(provider: MoyaProvider<GroupEndpoints>? = nil) {
        // 플러그인 추가
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)) // 로그 플러그인
        ]
        
        // provider 초기화
        self.provider = provider ?? MoyaProvider<GroupEndpoints>(plugins: plugins)
    }

    //MARK: - API funcs
    /// 그룹 탈퇴 api
    public func exitGroup(memberId: Int,  completion: @escaping (Result<GroupResponseDTo, NetworkError>) -> Void) {
        request(
            target: .exitGroup(memberId: memberId),
            decodingType: GroupResponseDTo.self,
            completion: completion
        )
    }
    /// 그룹 참가 api
    public func joinGroup(memberId: Int, teamCode: Int,  completion: @escaping (Result<GroupResponseDTo, NetworkError>) -> Void) {
        request(
            target: .joinGroup(memberId: memberId, teamCode: teamCode),
            decodingType: GroupResponseDTo.self,
            completion: completion
        )
    }
    /// 그룹 생성 api
    public func postGroup(email: String, completion: @escaping (Result<GroupResponseDTo, NetworkError>) -> Void) {
        request(
            target: .postGroup(email: email),  // email 전달
            decodingType: GroupResponseDTo.self,
            completion: completion
        )
    }
}
