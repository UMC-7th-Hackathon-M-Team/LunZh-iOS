//
//  GroupMainView.swift
//  LunZh
//
//  Created by 허준호 on 1/11/25.
//

import UIKit

class GroupMainView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
     // 그룹 메인화면 - 상단 앱바
     public lazy var groupMainAppBar = GroupMainAppBar()
    
     // 그룹 메인화면 - 중앙 바디영역
    public lazy var groupMainBody = GroupMainBody()
    
    // MARK: - Function
    
    // MARK: - add Fuction & Constraints
    
    
    private func addComponents(){
        [groupMainAppBar, groupMainBody].forEach(self.addSubview)
        
    }
    
    private func constraints(){
        
        groupMainAppBar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(self)
            $0.height.equalTo(60)
        }
        
        groupMainBody.snp.makeConstraints {
            $0.top.equalTo(groupMainAppBar.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(self)
        }
    }
    
}
