//
//  FakerGameView.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import Foundation
import UIKit
import SnapKit
import Then

class FakerGameView: UIView {
    
    // MARK: - UI Component
    let countdownLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdBoldFont(ofSize: 60)
    }
    
    let resultLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdBoldFont(ofSize: 40)
        $0.isHidden = true
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
        backgroundColor = .red
        
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
            $0.center.equalToSuperview()
        }
        
        exitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultLabel.snp.bottom).offset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
        }
    }
    
    // 게임 시작 시, 배경색 변경
    func updateBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }
    
    // 게임 종류 후, 결과 띄우기
    func showResult(_ text: String) {
        resultLabel.text = text
        resultLabel.isHidden = false
        exitButton.isHidden = false
    }
    
    // 시간 카운트 가리기
    func hidenCountdown() {
        countdownLabel.isHidden = true
    }
    
    // 일찍 눌렀을 때
    func showTooEarlyMessage() {
        countdownLabel.isHidden = false
        resultLabel.text = "너무 일찍 탭했습니다!"
        resultLabel.isHidden = false
        exitButton.isHidden = false
    }
}
