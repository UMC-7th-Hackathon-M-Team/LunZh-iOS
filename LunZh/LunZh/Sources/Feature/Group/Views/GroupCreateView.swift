//
//  GroupCreateView.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import Then
import SnapKit
class GroupCreateView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    private lazy var titleLabel = UILabel().then{
        $0.text = "그룹 이름을 지어주세요!"
        $0.textColor = .black
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
    }
    
    public lazy var groupNameInputBox = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), placeholder: "입력하세요")
    
    public lazy var groupCreateBtn = CustomButton(title: "새로운 그룹 만들기", titleColor: .gray800, isEnabled: true)
    
    // MARK: - Function
    
    // MARK: - add Fuction & Constraints
    
    
    private func addComponents(){
        [titleLabel, groupNameInputBox, groupCreateBtn].forEach(self.addSubview)
        
    }
    
    private func constraints(){
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(65)
            $0.left.equalTo(20)
        }
        
        groupNameInputBox.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        groupCreateBtn.snp.makeConstraints{
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    

}
