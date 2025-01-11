//
//  GameMainView.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class GameMainView: UIView {
    
    // MARK: - Properties
    
    let startButton = UIButton().then {
        $0.setTitle("게임 시작", for: .normal)
        $0.backgroundColor = .red80
        $0.layer.cornerRadius = 100 // 버튼을 원형으로
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    let titleLabel = UILabel().then {
        $0.text = "최고의 순발력을\n보여 주세요"
        $0.font = UIFont.ptdBoldFont(ofSize: 25)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    let descriptionLabel = UILabel().then {
        $0.text = "노란색에서 빨간색으로 변경될 때\n누구보다 빠르고 화면을 터치해보세요!"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .gray500
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(startButton)
        
        // 제목 레이블
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(25)
            $0.leading.equalToSuperview().offset(20)
        }
        
        // 설명 레이블
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
        }
        
        // 게임 시작 버튼
        startButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.centerY.equalToSuperview().offset(30)
            $0.width.height.equalTo(200) // 원형
        }
    }
}
