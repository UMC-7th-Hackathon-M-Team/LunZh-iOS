//
//  StoptwelveGameView.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class StoptwelveGameView: UIView {
    
    // MARK: - UI Components
    let countdownLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdBoldFont(ofSize: 60)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    let resultLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdBoldFont(ofSize: 40)
        $0.isHidden = true
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    let exitButton = UIButton().then {
        $0.setTitle("종료하기", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.isHidden = true
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .systemBlue
        
        addSubview(countdownLabel)
        addSubview(resultLabel)
        addSubview(exitButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        countdownLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
        
        exitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultLabel.snp.bottom).offset(30)
            $0.width.equalTo(120)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Public Methods
    func showStartMessage() {
        countdownLabel.text = "12.12초에\n멈추세요!"
    }
    
    func showResult(_ text: String) {
        resultLabel.text = text
        resultLabel.isHidden = false
        exitButton.isHidden = false
        countdownLabel.isHidden = true
    }
}
