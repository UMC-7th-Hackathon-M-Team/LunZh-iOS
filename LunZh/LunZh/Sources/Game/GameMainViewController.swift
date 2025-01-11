//
//  GameMainViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class GameMainViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = GameMainView()
    private let navBarManager = NavigationBarManager()
    private var kindOfGame: Int = 1 {
        didSet {
            updateTextForKindOfGame()
        }
    }

    // MARK: - Lifecycle
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupActions()
        updateTextForKindOfGame() // 초기 텍스트 설정
    }
    
    // MARK: - Setup
    private func setupNavigationBar() {
        navBarManager.setLogoTitle(to: navigationItem, logo: true)
        navBarManager.addBackButton(to: navigationItem, target: self, action: #selector(backButtonTapped))
    }

    private func setupActions() {
        mainView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Methods
    private func updateTextForKindOfGame() {
        switch kindOfGame {
        case 1:
            mainView.titleLabel.text = "당신의 운을\n보여 주세요"
            mainView.descriptionLabel.text = "게임시작 버튼을 누르면\n랜덤으로 추첨됩니다!"
        case 2:
            mainView.titleLabel.text = "최고의 순발력을\n보여 주세요"
            mainView.descriptionLabel.text = "노란색에서 빨간색으로 변경될 때\n누구보다 빠르고 화면을 터치해보세요!"
        case 3:
            mainView.titleLabel.text = "보이지 않는 12초를\n예측해 보세요"
            mainView.descriptionLabel.text = "시간 감각을 믿고 12초를 예측해보세요!\n얼마나 정확한지 확인해볼까요?"
        default:
            break
        }
    }
    
    // MARK: - Action
    @objc private func startButtonTapped() {
//        // kindOfGame 값 테스트를 위해 토글
//        kindOfGame = (kindOfGame == 2) ? 3 : 2
        
        // 게임 화면으로 이동
        let gameVC = RandomGameViewController()
         gameVC.modalPresentationStyle = .fullScreen
         present(gameVC, animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
