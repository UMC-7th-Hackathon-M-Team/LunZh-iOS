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
    private lazy var appBarLogo = UIImageView().then{
        $0.image = UIImage(systemName: "apple.logo")?.withRenderingMode(.alwaysOriginal)
        $0.contentMode = .scaleAspectFit
    }
    
    // 앱바 공유 버튼
    public lazy var sharingBtn = makeButton("공유")
    
    // 앱바 그룹탈퇴 버튼
    public lazy var exitBtn = makeButton("나가기")
    
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
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
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
        [appBarLogo, appBarButtons].forEach(self.addSubview)
    }
    
    private func constraints(){
        
        appBarLogo.snp.makeConstraints{
            $0.top.equalToSuperview().offset(24)
            $0.left.equalToSuperview().offset(24)
            
        }
        sharingBtn.snp.makeConstraints {
            $0.width.height.equalTo(40)
            
        }
        appBarButtons.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.right.equalToSuperview().offset(-24)
        }
    }
}

