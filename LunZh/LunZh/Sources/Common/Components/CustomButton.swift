//
//  CustomButton.swift
//  LunZh
//
//  Created by 이예성 on 1/11/25.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    init(
        title: String = "",
        titleColor: UIColor = .black,
        isEnabled: Bool = true
    ) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = isEnabled ? Constants.Colors.yellow60 : Constants.Colors.gray300
        
        self.titleLabel?.font = UIFont.ptdMediumFont(ofSize: 16)
        self.layer.cornerRadius = 20
        
        self.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String, titleColor: UIColor, isEnabled: Bool) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = isEnabled ? Constants.Colors.yellow60 : Constants.Colors.gray300
    }
    
    public func isEnabled(isEnabled: Bool){
        self.backgroundColor = isEnabled ? Constants.Colors.yellow60 : Constants.Colors.gray300
        self.titleLabel?.textColor = isEnabled ? Constants.Colors.gray800 : Constants.Colors.gray500
    }
}
