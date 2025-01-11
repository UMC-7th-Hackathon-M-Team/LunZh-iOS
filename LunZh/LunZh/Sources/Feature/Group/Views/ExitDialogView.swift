//
//  ExitDialogView.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class ExitDialogView: UIView {

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
        $0.tintColor = Constants.Colors.gray400
    }
    
    // 제목
    private lazy var title = UILabel().then{
        $0.text = "정말 나가시겠어요?"
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.textColor = .gray800
        $0.textAlignment = .center
    }

    
    // 버튼
    private lazy var exitBtn = CustomButton().then {
        $0.configure(title: "나가기", titleColor: UIColor.white, isEnabled: true)
    }
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
        [cancelBtn, title, exitBtn].forEach(containerView.addSubview)
        [containerView].forEach(self.addSubview)
    }
    
    private func constraints(){
        
        cancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
        }
        
        title.snp.makeConstraints{
            $0.top.equalToSuperview().offset(45)
            $0.horizontalEdges.equalToSuperview()
        }

        
        exitBtn.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(48)
            $0.horizontalEdges.bottom.equalToSuperview().inset(20)
            
        }
        containerView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(212)
            $0.width.equalTo(335)
        }
    }
}
