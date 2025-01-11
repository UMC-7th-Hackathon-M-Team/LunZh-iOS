//
//  NotJoinGroupView.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import UIKit
import Then

class NotJoinGroupView: UIView {

    public var makeGroupBtn = HomeCustomButton(title: "그룹 만들기",
                                                    subTitle: "새로 그룹을 만들고 싶으신가요?",
                                                imageColor: UIColor.gray300,
                                                backgroundColor: UIColor.yellow20)
    
    public var joinGroupBtn = HomeCustomButton(title: "그룹 참여하기",
                                                    subTitle: "친구에게 코드를 받으셨나요?",
                                                imageColor: UIColor.gray300,
                                                backgroundColor: UIColor.red20)
        

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        [makeGroupBtn, joinGroupBtn].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        makeGroupBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        joinGroupBtn.snp.makeConstraints {
            $0.top.equalTo(makeGroupBtn.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
