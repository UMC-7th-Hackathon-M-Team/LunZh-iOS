//
//  HomeCustomButton.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import UIKit
import Then

class HomeCustomButton: UIView {
    
    private lazy var title = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.ptdMediumFont(ofSize: 14)
    }
    
    private lazy var subTitle = UILabel().then {
        $0.textColor = UIColor.gray500
        $0.font = UIFont.ptdRegularFont(ofSize: 12)
    }
    
    private lazy var image = UIImageView().then {
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        $0.image = UIImage(systemName: "chevron.forward", withConfiguration: config)
    }
    
    public func configure(title: String, subTitle: String, backgrounColor: UIColor) {
        self.title.text = title
        self.subTitle.text = subTitle
        self.backgroundColor = backgrounColor
    }
    
    init(
        title: String,
        subTitle: String,
        imageColor: UIColor,
        backgroundColor: UIColor
    ) {
        super.init(frame: .zero)
        
        self.title.text = title
        self.subTitle.text = subTitle
        image.tintColor = imageColor
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        
        addComponents()
        constraints()
        
        self.snp.makeConstraints {
            $0.width.equalTo(336)
            $0.height.equalTo(92)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        [title, subTitle, image].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        subTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(27)
            $0.leading.equalToSuperview().offset(24)
        }
        
        title.snp.makeConstraints {
            $0.leading.equalTo(subTitle.snp.leading)
            $0.top.equalTo(subTitle.snp.bottom).offset(4)
        }
        
        image.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24)
        }
    }
}
