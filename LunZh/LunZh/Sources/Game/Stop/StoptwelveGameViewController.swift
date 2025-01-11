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
    private var gameModel = StoptwelveGameModel()
    private var gameView: StoptwelveGameView!
    private var tapGesture: UITapGestureRecognizer!
    
    // MARK: - Lifecycle
    override func loadView() {
        gameView = StoptwelveGameView(frame: UIScreen.main.bounds)
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
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Game Logic
    private func startCountdown() {
        var count = 3
        gameView.countdownLabel.text = "\(count)"
        
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
        gameModel.startGame()
        gameView.countdownLabel.text = "시작!"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.gameView.showStartMessage()
        }
    }
    
    // MARK: - Actions
    @objc private func screenTapped() {
        guard gameModel.isGameStarted else { return }
        
        let result = gameModel.calculateResult(currentTime: Date())
        gameView.showResult(result.message)
        gameModel.endGame()
    }
    
    @objc private func exitButtonTapped() {
        dismiss(animated: true)
    }
}
