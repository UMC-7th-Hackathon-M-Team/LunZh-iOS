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
    // MARK: - Properties
    
    let EllipseView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let countImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let countingStatusLabel = UILabel().then {
        // 노란색 "카운팅"과 흰색 "이 되고있습니다" 텍스트를 위한 AttributedString 설정
        let fullText = "카운팅이\n되고있습니다"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // "카운팅" 부분을 노란색으로
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.yellow100,
            range: (fullText as NSString).range(of: "카운팅")
        )
        
        // 나머지 텍스트를 흰색으로
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.white,
            range: (fullText as NSString).range(of: "이\n되고있습니다")
        )
        
        $0.attributedText = attributedString
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.isHidden = true
    }

    
    let timerInstructionLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdMediumFont(ofSize: 16)
        $0.textAlignment = .left
        $0.text = "보이지 않는 12초를 예상하고\n화면을 터치해 주세요!"
        $0.numberOfLines = 0
        $0.isHidden = true
    }
    
    let resultTimeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdBoldFont(ofSize: 60)
        $0.textAlignment = .center
        $0.isHidden = true
    }
    
    let differenceLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.ptdMediumFont(ofSize: 25)
        $0.textAlignment = .center
        $0.isHidden = true
    }
    
    let exitButton = UIButton().then {
        $0.setTitle("결과 제출하기", for: .normal)
        $0.backgroundColor = .yellow60
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.ptdBoldFont(ofSize: 18)
        $0.layer.cornerRadius = 90
        $0.isHidden = true
    }
    
    // MARK: - Init
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
        
        EllipseView.image = UIImage(named: "Ellipse")
        EllipseView.isHidden = true
        
        addSubview(EllipseView)
        addSubview(countImageView)
        addSubview(countingStatusLabel)
        addSubview(timerInstructionLabel)
        addSubview(resultTimeLabel)
        addSubview(differenceLabel)
        addSubview(exitButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        EllipseView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(400)
        }
        
        countImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(61)
            $0.center.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        // 상태 라벨을 왼쪽 상단에 배치
        countingStatusLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(80)
            $0.leading.equalToSuperview().offset(20)
        }
        
        // 안내 라벨을 상태 라벨 아래에 배치
        timerInstructionLabel.snp.makeConstraints {
            $0.top.equalTo(countingStatusLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
        }
        
        resultTimeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-120)
        }
        
        differenceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultTimeLabel.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        exitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(differenceLabel.snp.bottom).offset(20)
            $0.width.height.equalTo(180)
        }
    }
    
    // MARK: - Public Methods
    func showStartMessage() {
        countImageView.isHidden = true
        countingStatusLabel.isHidden = false
        timerInstructionLabel.isHidden = false
    }
    
    func showResult(elapsedTime: Double) {
        countingStatusLabel.isHidden = true
        timerInstructionLabel.isHidden = true
        resultTimeLabel.isHidden = false
        exitButton.isHidden = false
        
        resultTimeLabel.text = String(format: "%.2f초", elapsedTime)
    }
}

