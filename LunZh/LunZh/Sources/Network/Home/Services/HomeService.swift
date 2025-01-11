
import Foundation
import Moya

public final class HomeService : NetworkManager {
    typealias Endpoint = HomeEndpoints
    
    // MARK: - Provider 설정
    let provider: MoyaProvider<HomeEndpoints>
    
    public init(provider: MoyaProvider<HomeEndpoints>? = nil) {
        // 플러그인 추가
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)) // 로그 플러그인
        ]
        
        // provider 초기화
        self.provider = provider ?? MoyaProvider<HomeEndpoints>(plugins: plugins)
    }

    //MARK: - API funcs
    /// 자체 로그인 API
    public func getHomeInfo(data: Int, completion: @escaping (Result<HomeInfoResponseDTO, NetworkError>) -> Void) {
        request(target: .getHomeInfo(userId: data), decodingType: HomeInfoResponseDTO.self, completion: completion)
    }
    
    public func getCalendarInfo(data: Int, completion: @escaping (Result<CalendarInfoResponseDTO, NetworkError>) -> Void) {
        request(target: .getCalendarInfo(userId: data), decodingType: CalendarInfoResponseDTO.self, completion: completion)
    }
}
