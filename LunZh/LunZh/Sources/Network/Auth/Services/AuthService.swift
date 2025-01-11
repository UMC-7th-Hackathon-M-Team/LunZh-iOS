
import Foundation
import Moya

public final class AuthService : NetworkManager {
    typealias Endpoint = AuthorizationEndpoints
    
    // MARK: - Provider 설정
    let provider: MoyaProvider<AuthorizationEndpoints>
    
    public init(provider: MoyaProvider<AuthorizationEndpoints>? = nil) {
        // 플러그인 추가
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)) // 로그 플러그인
        ]
        
        // provider 초기화
        self.provider = provider ?? MoyaProvider<AuthorizationEndpoints>(plugins: plugins)
    }
    
    // MARK: - DTO funcs
    
    /// 로그인 데이터 구조 생성
    public func makeLoginDTO(/*username: String, */email: String) -> LoginDTO {
        return LoginDTO(/*username: username,*/ email: email)
    }
    
    //MARK: - API funcs
    /// 자체 로그인 API
    public func login(email: String, completion: @escaping (Result<LoginResponseDTO, NetworkError>) -> Void) {
        request(
            target: .postLogin(email: email),  // email 전달
            decodingType: LoginResponseDTO.self,
            completion: completion
        )
    }
    
    /// 로그아웃 API
    public func logout(completion: @escaping (Result<Void, NetworkError>) -> Void) {
        provider.request(.postLogout) { result in
            switch result {
            case .success(let response):
                completion(.success(()))
            case .failure(let error):
                let networkError = self.handleNetworkError(error)
                completion(.failure(networkError))
            }
        }
    }
    
    /// 회원 탈퇴 API
    public func userDelete(completion: @escaping (Result<Void, NetworkError>) -> Void) {
        provider.request(.postDelete) { result in
            switch result {
            case .success(let response):
                completion(.success(()))
            case .failure(let error):
                let networkError = self.handleNetworkError(error)
                completion(.failure(networkError))
            }
        }
    }
    
    
    /// 자체 로그인 API
    public func postMemberInfo(memberId: Int, nickName: String, preferFood: [String], completion: @escaping (Result<Void, NetworkError>) -> Void) {
        provider.request(.postMemberInfo(memberId: memberId, nickName: nickName, preferFood: preferFood))
        { result in
            switch result {
            case .success(let response):
                completion(.success(()))
            case .failure(let error):
                let networkError = self.handleNetworkError(error)
                completion(.failure(networkError))
            }
        }
    }
}
