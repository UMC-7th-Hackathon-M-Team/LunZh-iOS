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
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    // 제목
    private lazy var title = UILabel().then{
        $0.text = "제목"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    // 내용
    private lazy var content = UILabel().then{
        $0.text = "내용"
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    // 버튼
    private lazy var button = UIButton().then{
        $0.setTitle( "확인", for: .normal)
        $0.setTitleColor( .white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.backgroundColor = .systemBlue
    }
    
    // MARK: - Stack
    private lazy var dialogStack = makeStackView()
    
    // MARK: - Fuction
    private func makeStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [title, content, button])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    // MARK: - addFunction & Constraints

    private func addStackView(){
        [title, content, button].forEach(dialogStack.addArrangedSubview)
    }
    
    private func addComponents(){
        containerView.addSubview(dialogStack)
        [containerView].forEach(self.addSubview)
    }
    
    private func constraints(){
        
        dialogStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.width.equalTo(200)
        }
    }
    
}
