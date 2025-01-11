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
    private var gameModel = FakerGameModel()
    private var gameView: FakerGameView!
    private var timer: Timer?
    private var tapGesture: UITapGestureRecognizer!
    
    // MARK: - Lifecycle
    override func loadView() {
        gameView = FakerGameView(frame: UIScreen.main.bounds)
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        startCountdown()
    }
    
    // MARK: - Setup
    private func setupActions() {
        gameView.exitButton.addTarget(self,
                                    action: #selector(exitButtonTapped),
                                    for: .touchUpInside)
        
        tapGesture = UITapGestureRecognizer(target: self,
                                               action: #selector(screenTapped))
        tapGesture.isEnabled = false  // 초기에는 비활성화
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Game Logic
    private func startCountdown() {
        gameModel.startCountdown()
        var count = 3
        gameView.countdownLabel.text = "\(count)"
        tapGesture.isEnabled = false  // 카운트다운 중에는 터치 비활성화
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            count -= 1
            self?.gameView.countdownLabel.text = count > 0 ? "\(count)" : ""
           
            if count == 0 {
                timer.invalidate()
                self?.startGame()
            }
        }
    }
   
    private func startGame() {
        gameView.hidenCountdown()
        gameModel.startGame()
        tapGesture.isEnabled = true  // 카운트다운 중에는 터치 비활성화
       
        let randomInterval = Double.random(in: 1...12)
        print("몇 초? : ", randomInterval)
        timer = Timer.scheduledTimer(withTimeInterval: randomInterval,
                                  repeats: false) { [weak self] _ in
            self?.gameView.updateBackgroundColor(.systemGreen)
            self?.gameModel.setStartTime(Date())
        }
    }
       
    // MARK: - Actions
    @objc private func screenTapped() {
        let isGreenBackground = gameView.backgroundColor == .systemGreen
        let result = gameModel.calculateResult(currentTime: Date(),
                                             backgroundColor: isGreenBackground)
        
        if result.isTooEarly {
            gameView.showTooEarlyMessage()
            timer?.invalidate()
        } else {
            gameView.showResult(result.message)
        }
        
        gameModel.endGame()
        tapGesture.isEnabled = false  // 게임 종료 시 터치 비활성화
    }
       
    @objc private func exitButtonTapped() {
        dismiss(animated: true)
    }
}
