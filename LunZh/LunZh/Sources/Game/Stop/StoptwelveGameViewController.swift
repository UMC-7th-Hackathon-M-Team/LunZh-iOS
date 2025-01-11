//
//  StoptwelveGameViewController.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class StoptwelveGameViewController: UIViewController {
    // MARK: - Properties
    private let gameView = StoptwelveGameView()
    private var startTime: Date?
    private var isGameStarted = false
    private let targetTime: Double = 12.12
    private var timeDifference: Double?
    
    let gameService = GameService()
    
    var userId: Int? {
        UserDefaults.standard.object(forKey: "userId") as? Int
    }
    
    var teamId: Int? {
        UserDefaults.standard.object(forKey: "teamId") as? Int
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
        
        gameView.exitButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        startCountdown()
    }
    
    
    
    // MARK: - Game Logic
    private func startCountdown() {
        var count = 3
//        gameView.countdownLabel.text = ""  // 텍스트 대신 이미지를 사용할 것이므로 비움
        gameView.countImageView.image = UIImage(named: "\(count)")  // "3" 이미지
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            count -= 1
            
            if count > 0 {
                self?.gameView.countImageView.image = UIImage(named: "\(count)")  // "2", "1" 이미지
            } else {
                timer.invalidate()
                self?.gameView.countImageView.image = nil  // 이미지 제거
                self?.startGame()
            }
        }
    }
    
    private func startGame() {
        gameView.EllipseView.isHidden = false
        gameView.showStartMessage()
        isGameStarted = true
        startTime = Date()
    }
    
    @objc private func handleTap() {
        guard isGameStarted else { return }
        
        if let startTime = startTime {
            let currentTime = Date()
            let elapsedTime = currentTime.timeIntervalSince(startTime)
            
            // Calculate 12.12 - elapsedTime
            timeDifference = (targetTime - elapsedTime)*1000
            
            print(timeDifference as Any)
            
            gameView.EllipseView.isHidden = true
            gameView.showResult(elapsedTime: elapsedTime)
            
            isGameStarted = false
        }
    }
    
    @objc private func dismissView() {
        // 내가 보낼 데이터를 DTO로 만듬
        let myGameDTO = self.gameService.makeResultDTO(gameId: <#T##String#>, memberFood: <#T##String#>, result: Int(timeDifference!))
        
        //서버로 데이터 전송
        self.gameService.gameResult(teamId: teamId!, memberId: userId!, data: myGameDTO) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        dismiss(animated: true)
    }
}
