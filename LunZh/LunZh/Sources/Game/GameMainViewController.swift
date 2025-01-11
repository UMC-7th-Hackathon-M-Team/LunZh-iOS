//
//  GameMainViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class GameMainViewController: UIViewController {
    
    // MARK: - Properties
    
    // 게임 시작 버튼
    private let startButton = UIButton().then {
        $0.setTitle("게임 시작", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = UIFont.ptdBoldFont(ofSize: 20)
    }
    
    // 게임 아이콘
    private let iconImageView = UIImageView().then {
        $0.image = UIImage(systemName: "bolt.fill")
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(iconImageView)
        view.addSubview(startButton)
        
        // 게임 아이콘
        iconImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        // 게임 시작 버튼
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(iconImageView.snp.bottom).offset(30)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Action

    @objc private func startButtonTapped() {
//        let gameVC = FakerGameViewController()
        let gameVC = StoptwelveGameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        present(gameVC, animated: true)
    }
}
