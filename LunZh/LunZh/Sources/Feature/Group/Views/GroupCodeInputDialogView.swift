//
//  GroupCodeInputDialogView.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class GroupCodeInputDialogView: UIView {

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
    
    // 컨테이너
    public lazy var containerView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    
    public lazy var cancelBtn = UIButton().then{
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .gray400
    }
    
    // 제목
    private lazy var title = UILabel().then{
        $0.text = "그룹에 참여해보세요"
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.textColor = .gray800
        $0.textAlignment = .center
    }
    
    // 부제목
    private lazy var subTitle = UILabel().then{
        $0.text = "친구로부터 공유받은 코드를 입력하세요!"
        $0.font = UIFont.ptdMediumFont(ofSize: 16)
        $0.textColor = .gray500
        $0.textAlignment = .center
    }
    
    // 내용
    public lazy var codeInputBox = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), placeholder: "코드를 입력하세요")

    
    // 버튼
    public var confirmBtn = CustomButton(title: "확인", titleColor: .gray500, isEnabled: false)
    // MARK: - Stack
    private lazy var dialogStack = makeStackView()
    
    // MARK: - Fuction
    private func makeStackView() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    // MARK: - addFunction & Constraints

    private func addStackView(){
        //[title, subTitle, content, button].forEach(dialogStack.addArrangedSubview)
    }
    
    private func addComponents(){
        //containerView.addSubview(dialogStack)
        [cancelBtn, title, subTitle, codeInputBox, confirmBtn].forEach(containerView.addSubview)
        [containerView].forEach(self.addSubview)
    }
    
    private func constraints(){
        
        cancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.height.width.equalTo(16)
        }
        
        title.snp.makeConstraints{
            $0.top.equalToSuperview().offset(45)
            $0.horizontalEdges.equalToSuperview()
        }
        
        subTitle.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
        }
        
        codeInputBox.snp.makeConstraints{
            $0.top.equalTo(subTitle.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        confirmBtn.snp.makeConstraints{
            $0.top.equalTo(codeInputBox.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            
        }
        containerView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(324)
            $0.width.equalTo(335)
        }
    }
}
