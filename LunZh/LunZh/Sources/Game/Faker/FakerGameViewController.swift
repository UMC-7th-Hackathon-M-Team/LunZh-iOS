//
//  FakerGameViewController.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import Foundation
import UIKit

class FakerGameViewController: UIViewController {
    // MARK: - Properties
    private let gameView = FakerGameView()
    private var startTime: Date?
    private var timer: Timer?
    private var randomInterval: TimeInterval = 0
    private var isGameStarted = false
    private var isColorChanged = false
    
    private var reactionTime: TimeInterval = 0

    let gameService = GameService()
    
    var userId: Int? {
        UserDefaults.standard.object(forKey: "userId") as? Int
    }
    
    var teamId: Int? {
        UserDefaults.standard.object(forKey: "teamId") as? Int
    }
    
    
    var gameNumber: Int? {
        UserDefaults.standard.object(forKey: "gameNumber") as? Int
    }
    
    var foodName: String? {
        UserDefaults.standard.object(forKey: "foodName") as? String
    }

    
    // MARK: - Lifecycle
    override func loadView() {
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    
    // MARK: - Setup
    private func setupGame() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        gameView.resultButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        
        startCountdown()
    }
    
    // MARK: - Game Logic
    private func startCountdown() {
        var count = 3
        gameView.countImageView.image = UIImage(named: "\(count)")
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            count -= 1
            
            if count > 0 {
                self?.gameView.countImageView.image = UIImage(named: "\(count)")
            } else {
                self?.gameView.countImageView.image = nil
                timer.invalidate()
                self?.startGame()
            }
        }
        print(teamId as Any)
    }
    
    private func startGame() {
        gameView.backgroundColor = .yellow60
        isGameStarted = true
        randomInterval = TimeInterval(Int.random(in: 1...12))
        startTime = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: randomInterval, repeats: false) { [weak self] _ in
            self?.gameView.backgroundColor = .red80
            self?.isColorChanged = true
            self?.startTime = Date()
        }
    }
    
    @objc private func handleTap() {
        guard isGameStarted else { return }
        
        if let startTime = startTime {
            let currentTime = Date()
            reactionTime = currentTime.timeIntervalSince(startTime)
            
            if isColorChanged {
                // 배경색을 빨간색으로 변경
                gameView.backgroundColor = .gray700
                
                // 결과 텍스트 스타일 수정
                gameView.resultLabel.text = "\(Int(reactionTime * 1000))ms"
                gameView.resultLabel.font = .systemFont(ofSize: 60, weight: .bold) // 폰트 크기 증가
                
                // 결과 버튼 스타일 수정
                gameView.resultButton.isHidden = false
                
                isGameStarted = false
                timer?.invalidate()
            }
        }
    }
    
    @objc private func restartGame() {
        // 내가 보낼 데이터를 DTO로 만듬
        var resultNum = ""
        if gameNumber == 1{
            resultNum = "A"
        }else if gameNumber == 2{
            resultNum = "B"
        }else{
            resultNum = "C"
        }
        let myGameDTO = self.gameService.makeResultDTO(gameId: resultNum, memberFood: foodName!, result: Int(reactionTime))
        
        // 서버로 데이터 전송
        self.gameService.gameResult(teamId: teamId!, memberId: userId!, data: myGameDTO) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        let gameVc = GameResultWaitingViewController()
        
        gameVc.modalPresentationStyle = .fullScreen
        present(gameVc, animated: true)
    }
}
