//
//  GetMenuView.swift
//  LunZh
//
//  Created by 허준호 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class GetMenuView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    private lazy var title1 = makeLabel("모두와 먹고싶은 메뉴를")
    
    private lazy var title2 = makeLabel("입력해 주세요")
    
    private lazy var menuInputBox = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), placeholder: "직접 입력하세요.")
    
    public lazy var menuGameStartBtn = CustomButton(title: "시작하기", titleColor: .gray800, isEnabled: true)
    // MARK: - Function
    
    private func makeLabel(_ text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = .gray800
        label.font = UIFont.ptdExtraBoldFont(ofSize: 24)
        return label
    }
    
    
    
    // MARK: - add Fuction & Constraints
    
    
    
    
    private func addComponents(){
        [title1, title2, menuInputBox, menuGameStartBtn].forEach(self.addSubview)
         
    }
    
    private func constraints(){
        
        title1.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(33)
            $0.left.equalTo(30)
        }
        
        title2.snp.makeConstraints{
            $0.top.equalTo(title1.snp.bottom).offset(5)
            $0.left.equalTo(30)
        }
        
        menuInputBox.snp.makeConstraints {
            $0.top.equalTo(title2.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        menuGameStartBtn.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    
    }

}
