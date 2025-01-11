//
//  CustomButton.swift
//  LunZh
//
//  Created by 이예성 on 1/11/25.
//

import UIKit
import SnapKit

class CustomRoundedButton: UIButton {
    init(
        title: String = "",
        titleColor: UIColor = .black,
        backgroundColor: UIColor = .white
    ) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        
        self.titleLabel?.font = UIFont.ptdBoldFont(ofSize: 18)
        self.layer.cornerRadius = 90
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(180)
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
    }

}
