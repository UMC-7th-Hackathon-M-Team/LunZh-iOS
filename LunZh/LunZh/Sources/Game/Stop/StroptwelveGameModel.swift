//
//  StroptwelveGameModel.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import Foundation
import UIKit

//struct StoptwelveGameModel {
//    var startTime: Date?
//    var isGameStarted: Bool = false
//    let targetTime: Double = 12.12
//    
//    struct GameResult {
//        let elapsedTime: Double
//        let difference: Double
//        let targetTime: Double = 12.12
//        
////        var message: String {
////            let resultText = String("결과")
////            let elapsedText = String(format: "%.2f초", elapsedTime)
////            let differenceText = if elapsedTime < targetTime {
////                String(format: "목표시간보다 %.2f초 빨랐어요!", difference)
////            } else {
////                String(format: "목표시간보다 %.2f초 느렸어요!", difference)
////            }
////            return "\(resultText)\n\(elapsedText)\n\(differenceText)"
////        }
//    }
//    
//    mutating func startGame() {
//        startTime = Date()
//        isGameStarted = true
//    }
//    
//    mutating func endGame() {
//        isGameStarted = false
//    }
//    
//    func calculateResult(currentTime: Date) -> GameResult {
//        guard let startTime = startTime else {
//            return GameResult(elapsedTime: 0, difference: targetTime)
//        }
//        
//        let elapsedTime = currentTime.timeIntervalSince(startTime)
//        let difference = abs(targetTime - elapsedTime)
//        
//        return GameResult(elapsedTime: elapsedTime, difference: difference)
//    }
//}
//
//
