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
    //게임 결과 POST DTO Setting
    public func makeResultDTO(gameId: String, memberFood: String, result: Int) -> GameRequestDTO {
        return GameRequestDTO(gameId: gameId, memberFood: memberFood, result: result)
    }
    
    /// 게임 참여 POST API
    public func gameStart(teamId: Int, memeberId: Int,  completion: @escaping (Result<GameResponsesDTO, NetworkError>) -> Void) {
        request(
            target: .gameStart(teamId: teamId, memeberId: memeberId),
            decodingType: GameResponsesDTO.self,
            completion: completion
        )
    }
    
    /// 게임 최종 결과 GET API
    public func getTotalResult(teamId: Int, completion: @escaping (Result<GameResultResponsesDTO, NetworkError>) -> Void) {
        request(target: .getTotalResult(teamId: teamId), decodingType: GameResultResponsesDTO.self, completion: completion)
    }
    
    /// 게임 결과 POST API
    public func gameResult(teamId: Int, memberId: Int, data: GameRequestDTO,  completion: @escaping (Result<String, NetworkError>) -> Void) {
        request(target: .gameResult(teamId: teamId, memeberId: memberId, data: data), decodingType: String.self, completion: completion)
    }
    
}

