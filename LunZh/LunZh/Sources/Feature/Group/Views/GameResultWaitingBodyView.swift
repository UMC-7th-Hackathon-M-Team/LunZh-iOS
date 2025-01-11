//
//  GameResultWaitingView.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class GameResultWaitingBodyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addStackView()
        addComponents()
        constraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    // 게임 결과 로딩 텍스트
    private lazy var gameResultLoadingText1: UILabel = {
        let label = UILabel()
        let fullText = "12시 12분에"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // 마지막 글자의 범위를 계산합니다.
        let lastCharIndex = fullText.index(before: fullText.endIndex)
        let range = lastCharIndex..<fullText.endIndex
        let nsRange = NSRange(range, in: fullText)
        
        // 마지막 글자에 검은색과 볼드 폰트 적용
        attributedString.addAttribute(.foregroundColor, value: Constants.Colors.gray800!, range: nsRange)
        attributedString.addAttribute(.font, value: UIFont.ptdBoldFont(ofSize: 24), range: nsRange)
        
        label.attributedText = attributedString
        label.textColor = .yellow100
        label.font = UIFont.ptdBoldFont(ofSize: 24) // 전체 텍스트 기본 폰트
        return label
    }()
    
    // 게임 결과 로딩 텍스트
    private lazy var gameResultLoadingText2 = UILabel().then{
        $0.text = "알림으로 결과를 알려 드려요!"
        $0.textColor = .gray800
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        
    }
    
    // 게임 결과 로딩 텍스트
    private lazy var gameResultLoadingText3 = UILabel().then{
        $0.text = "잠시만 기다려 주세요."
        $0.textColor = .gray500
        $0.font = UIFont.ptdMediumFont(ofSize: 16)
  
    }
    
    private lazy var textStack = makeStackView()
    
    // MARK: - Function
    private func makeStackView() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }
    // MARK: - add Fuction & Constraints
    
    private func addStackView(){
        [gameResultLoadingText1, gameResultLoadingText2].forEach(textStack.addArrangedSubview)
    }
    
    private func addComponents(){
        [textStack, gameResultLoadingText3].forEach(self.addSubview)
        
    }
    
    private func constraints(){
        
        textStack.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(20)
        }
        
        gameResultLoadingText3.snp.makeConstraints{
            $0.top.equalTo(textStack.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
        }
    }

}
