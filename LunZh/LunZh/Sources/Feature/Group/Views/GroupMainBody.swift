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
    private lazy var title2 = UILabel().then{
        $0.text = "함께하고 있어요!"
        $0.textColor = .gray800
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
    }
    
    private lazy var title1: UILabel = {
        let label = UILabel()
        let fullText = "유엠씨에"
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

    
    
    // 메뉴 선정 버튼
    public lazy var menuSelectBtn = UIButton().then{
        $0.setImage(UIImage(named: "gameStartBtn"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
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
        [title1, title2, menuSelectBtn].forEach(self.addSubview)
    }
    
    private func constraints(){

        
        title1.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
            $0.left.equalToSuperview().offset(20)
        }
        
        title2.snp.makeConstraints{
            $0.top.equalTo(title1.snp.bottom)
            $0.left.equalToSuperview().offset(20)
        }
        
        menuSelectBtn.snp.makeConstraints{
            $0.top.equalTo(title2.snp.bottom).offset(95)
            $0.horizontalEdges.equalToSuperview().inset(50)
        }
    }
}
