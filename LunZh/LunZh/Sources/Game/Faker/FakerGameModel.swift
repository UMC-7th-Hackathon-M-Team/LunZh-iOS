//
//  FakerGameModel.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import Foundation
import UIKit

//struct FakerGameModel {
//    var startTime: Date?
//    var isGameStarted: Bool = false
//    var isGameEnded: Bool = false
//    var isCountingDown: Bool = false
//    
//    // 게임 결과 모델
//    struct GameResult {
//        let reactionTime: Double
//        let isTooEarly: Bool
//        
//        var message: String {
//            if isTooEarly {
//                return "너무 일찍 탭했습니다!"
//            } else {
//                return "반응속도: \(String(format: "%.1f", reactionTime))ms"
//            }
//        }
//    }
//    
//    mutating func startCountdown() {
//        isCountingDown = true
//        isGameStarted = false
//        isGameEnded = false
//    }
//    
//    mutating func startGame() {
//        startTime = nil
//        isGameStarted = true
//        isCountingDown = false
//        isGameEnded = false
//    }
//    
//    mutating func endGame() {
//        isGameEnded = true
//        isGameStarted = false
//    }
//    
//    mutating func setStartTime(_ date: Date) {
//        startTime = date
//    }
//    
//    func calculateResult(currentTime: Date, backgroundColor: Bool) -> GameResult {
//        // 빨간 배경일 때 탭한 경우
//        if !backgroundColor {
//            return GameResult(reactionTime: 0, isTooEarly: true)
//        }
//        
//        guard let startTime = startTime else {
//            return GameResult(reactionTime: 0, isTooEarly: true)
//        }
//        
//        let reactionTime = currentTime.timeIntervalSince(startTime) * 1000
//        return GameResult(reactionTime: reactionTime, isTooEarly: false)
//    }
//}
//
