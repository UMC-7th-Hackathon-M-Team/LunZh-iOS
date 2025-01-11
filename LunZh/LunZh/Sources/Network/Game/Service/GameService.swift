//
//  GameService.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import Foundation
import Moya

public final class GameService: NetworkManager {
    
    typealias Endpoint = GameEndpoint
    
    // Provider 설정
    let provider: MoyaProvider<GameEndpoint>
    
    public init(provider: MoyaProvider<GameEndpoint>? = nil) {
        // 플러그인 추가
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)) // 로그 플러그인
        ]
        
        // provider 초기화
        self.provider = provider ?? MoyaProvider<GameEndpoint>(plugins: plugins)
    }
    
    //MARK: - API funcs
    
    /// 게임 참여 API
    public func gameStart(completion: @escaping (Result<[WinePreviewResponse]?, NetworkError>) -> Void) {
//        request(target: .getWishList, decodingType: [WinePreviewResponse].self, completion: completion)
        requestOptional(target: .getWishList, decodingType: [WinePreviewResponse].self, completion: completion)
    }
    
    /// 게임 결과 API
    public func gameResult(teamId: Int, memberId: Int, data: GameRequestDTO completion: @escaping (Result<String, NetworkError>) -> Void) {
        request(target: .gameResult(teamId: teamId, memeberId: memberId), decodingType: String.self, completion: completion)
    }
}

