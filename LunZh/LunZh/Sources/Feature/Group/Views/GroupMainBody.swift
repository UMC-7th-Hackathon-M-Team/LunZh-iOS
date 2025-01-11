//
//  GroupMainBody.swift
//  LunZh
//
//  Created by 허준호 on 1/11/25.
//

import UIKit

class GroupMainBody: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        //addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    // 그룹명
    private lazy var groupNameLabel = UILabel().then{
        $0.text = "그룹: 그레이스"
        $0.textColor = .black
        $0.font = UIFont.ptdBoldFont(ofSize: 18)
    }
    // 게임시작 버튼
    public lazy var gameStartBtn = makeButton("게임시작")
    
    // MARK: - Stack
    
    // 앱바 버튼 모음
    private lazy var appBarButtons = makeStackView(axis: .horizontal, spacing: 10)
    
    
    
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
        button.setTitle(name, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.backgroundColor = .blue
        
        return button
    }
    
    // MARK: - addFunction & Constants
    
//    private func addStackView(){
//        [sharingBtn, exitBtn].forEach(appBarButtons.addArrangedSubview)
//    }
    
    private func addComponents(){
        [groupNameLabel, gameStartBtn].forEach(self.addSubview)
    }
    
    private func constraints(){
        
        
        groupNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        gameStartBtn.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
}
