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
    
    private lazy var menuInputBox = UITextField().then{
        $0.placeholder = "메뉴를 입력해주세요"
        $0.textColor = .lightGray
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
        $0.font = .systemFont(ofSize: 15)
        
    }
    // MARK: - Function
    
    private func makeLabel(_ text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.ptdExtraBoldFont(ofSize: 20)
        return label
    }
    
    
    
    // MARK: - add Fuction & Constraints
    
    
    
    
    private func addComponents(){
        [title1, title2, menuInputBox].forEach(self.addSubview)
         
    }
    
    private func constraints(){
        
        title1.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
            $0.left.equalTo(30)
        }
        
        title2.snp.makeConstraints{
            $0.top.equalTo(title1.snp.bottom).offset(5)
            $0.left.equalTo(30)
        }
        
        menuInputBox.snp.makeConstraints {
            $0.top.equalTo(title2.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
    
    }

}
