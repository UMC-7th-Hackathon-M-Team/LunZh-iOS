//
//  CustomDialogView.swift
//  LunZh
//
//  Created by 허준호 on 1/11/25.
//

import UIKit
import Then
import SnapKit

class CustomDialogView: UIView {

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
        $0.text = "친구와 함께해요!"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    // 부제목
    private lazy var subTitle = UILabel().then{
        $0.text = "친구에게 코드를 공유해보세요"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = Constants.Colors.gray500
        $0.textAlignment = .center
    }
    
    // 내용
    private lazy var sharingCode = UILabel().then{
        $0.text = "215789"
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = Constants.Colors.yellow100
        $0.textAlignment = .center
    }
    
    // 버튼
    private lazy var confirmBtn = CustomButton().then {
        $0.configure(title: "확인", titleColor: UIColor.white, isEnabled: true)
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
        [cancelBtn, title, subTitle, sharingCode, confirmBtn].forEach(containerView.addSubview)
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
        
        subTitle.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
        }
        
        sharingCode.snp.makeConstraints{
            $0.top.equalTo(subTitle.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview()
        }
        
        confirmBtn.snp.makeConstraints{
            $0.top.equalTo(sharingCode.snp.bottom).offset(64)
            $0.horizontalEdges.equalToSuperview().inset(19)
        }
        containerView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(324)
            $0.width.equalTo(335)
        }
    }
    
}
