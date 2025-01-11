//
//  GameResultWaitingView.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class GameResultWaitingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        constraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    // 게임 결과 로딩 텍스트
    private lazy var gameResultLoadingText1 = UILabel().then{
        $0.text = "12시 12분에"
        
    }
    
    // 게임 결과 로딩 텍스트
    private lazy var gameResultLoadingText2 = UILabel().then{
        $0.text = "푸쉬 알림으로 결과를 알려 드려요!"
        $0.textColor = .black
        //$0.font = UIFont.pt
    }
    
    // 게임 결과 로딩 텍스트
    private lazy var gameResultLoadingText3 = UILabel().then{
        $0.text = "잠시만 기다려 주세요..."
        
    }
    
    // MARK: - Function
    
    // MARK: - add Fuction & Constraints
    
    
    private func addComponents(){
    
        
    }
    
    private func constraints(){
        
    }

}
