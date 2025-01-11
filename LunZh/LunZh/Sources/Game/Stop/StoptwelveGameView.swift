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
        $0.textColor = .black
        $0.font = UIFont.ptdBoldFont(ofSize: 60)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
//    // 결과
//    let resultTitleLabel = UILabel().then {
//        $0.textColor = .gray700
//        $0.font = UIFont.ptdMediumFont(ofSize: 18)
//        $0.text = "결과"
//        $0.isHidden = true
//        $0.textAlignment = .center
//    }
    
    // @@시간
    let timeLabel = UILabel().then {
        $0.textColor = .yellow100
        $0.font = UIFont.ptdMediumFont(ofSize: 36)
        $0.isHidden = true
        $0.textAlignment = .center
    }
    
    // 목표시간 차이
    let differenceLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.ptdMediumFont(ofSize: 25)
        $0.isHidden = true
        $0.textAlignment = .center
    }
    
    let exitButton = UIButton().then {
        $0.setTitle("결과 제출하기", for: .normal)
        $0.backgroundColor = .yellow60
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 90
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
        backgroundColor = .gray700
        
        addSubview(countdownLabel)
//        addSubview(resultTitleLabel)
        addSubview(timeLabel)
        addSubview(differenceLabel)
        addSubview(exitButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        countdownLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
//        resultTitleLabel.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview().offset(-120)  // 위쪽에 배치
//        }
        
        timeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-120)
        }
        
        differenceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(timeLabel.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        exitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(differenceLabel.snp.bottom).offset(40)
            $0.width.equalTo(180)
            $0.height.equalTo(180)
        }
    }
    
    // MARK: - Public Methods
    func showStartMessage() {
        countdownLabel.text = "12.12초에\n멈추세요!"
    }
    
    // StoptwelveGameView.swift
    func showResult(elapsedTime: Double, difference: Double, isEarly: Bool) {
        countdownLabel.isHidden = true
        
//        resultTitleLabel.isHidden = false
        timeLabel.isHidden = false
        differenceLabel.isHidden = false
        exitButton.isHidden = false
        
        timeLabel.text = String(format: "%.2f초", elapsedTime)
        
        // NSAttributedString 생성
        let fullText = isEarly ?
            "목표시간보다 %.2f초 빨랐어요!" :
            "목표시간보다 %.2f초 느렸어요!"
        let attributedString = NSMutableAttributedString(
            string: String(format: fullText, difference)
        )
        
        // 숫자 부분 찾기
        let numberStr = String(format: "%.2f", difference)
        if let range = attributedString.string.range(of: numberStr) {
            let nsRange = NSRange(range, in: attributedString.string)
            
            // 숫자 부분만 노란색으로 설정
            attributedString.addAttribute(
                .foregroundColor,
                value: UIColor.yellow100,
                range: nsRange
            )
        }
        
        differenceLabel.textColor = .yellow20  // 기본 텍스트는 흰색
        differenceLabel.attributedText = attributedString
    }
}
