//
//  GroupMainAppBar.swift
//  LunZh
//
//  Created by 허준호 on 1/11/25.
//

import UIKit
import Then
import SnapKit

class GroupMainAppBar: UIView {
    //var onButtonTapped: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addStackView()
        addComponents()
        constraints()
        
       //sharingBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    // 앱바 로고
    private lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(named: "groupBackBtn"), for: .normal)
        $0.tintColor = .gray400
    }
    
    // 앱바 공유 버튼
    public lazy var sharingBtn = makeButton("share")
    
    // 앱바 그룹탈퇴 버튼
    public lazy var exitBtn = makeButton("out")
    
    // MARK: - Stack
    
    // 앱바 버튼 모음
    private lazy var appBarButtons = makeStackView(axis: .horizontal, spacing: 30)
    
    
    
    // MARK: - Function
    
    private func makeStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .equalSpacing
        stackView.spacing = spacing
        return stackView
    }
    
    private func makeButton(_ name: String) -> UIButton{
        let button = UIButton()
        button.setImage(UIImage(named: name), for: .normal)
        button.tintColor = .gray500
        return button
    }
    
//    @objc private func buttonTapped(){
//        onButtonTapped?()
//    }
    

    // MARK: - addFunction & Constants
    
    private func addStackView(){
        [sharingBtn, exitBtn].forEach(appBarButtons.addArrangedSubview)
    }
    
    private func addComponents(){
        [backBtn, appBarButtons].forEach(self.addSubview)
    }
    
    private func constraints(){
        
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(24)
            $0.left.equalToSuperview().offset(24)
            
        }
        sharingBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
            
        }
        
        exitBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
            
        }
        appBarButtons.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.right.equalToSuperview().offset(-24)
        }
    }
}

