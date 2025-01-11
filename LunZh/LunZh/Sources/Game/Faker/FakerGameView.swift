//
//  FakerGameView.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class FakerGameView: UIView {
    // MARK: - Properties
    let countImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let resultLabel = UILabel().then {
       $0.textColor = .white
       $0.font = UIFont.ptdBoldFont(ofSize: 50)
       $0.textAlignment = .center
   }
   
   let resultButton = UIButton().then {
       $0.setTitle("결과 재출하기", for: .normal)
       $0.backgroundColor = .yellow60
       $0.layer.cornerRadius = 90
       $0.layer.masksToBounds = true
       $0.setTitleColor(.black, for: .normal)
       $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
       $0.isHidden = true
   }
    
//    let exampleButton = CustomRoundedButton(title: "결과 제출", titleColor: Constants.Colors.gray800!, backgroundColor: Constants.Colors.yellow60!)
//    
    
    
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
        backgroundColor = .black
        
        addSubview(countImageView)
        addSubview(resultLabel)
        addSubview(resultButton)
        
        countImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        resultLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-80)
        }
        
        resultButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.height.equalTo(180)
            $0.width.equalTo(180)
        }
    }
}
