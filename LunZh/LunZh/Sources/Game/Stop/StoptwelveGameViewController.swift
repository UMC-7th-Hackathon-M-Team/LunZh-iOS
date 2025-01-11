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
        gameView.showStartMessage()
        isGameStarted = true
        startTime = Date()
    }
    
    @objc private func handleTap() {
        guard isGameStarted else { return }
        
        if let startTime = startTime {
            let currentTime = Date()
            let elapsedTime = currentTime.timeIntervalSince(startTime)
            
            // 결과 표시 (차이 표시 제거)
            gameView.showResult(elapsedTime: elapsedTime)
            
            isGameStarted = false
        }
    }
    
    @objc private func dismissView() {
        dismiss(animated: true)
    }
}
