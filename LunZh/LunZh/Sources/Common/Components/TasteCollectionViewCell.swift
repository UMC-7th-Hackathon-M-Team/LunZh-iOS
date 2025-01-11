//
//  TasteCollectionViewCell.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class TasteCollectionViewCell: UICollectionViewCell {
    static let identifier = "TasteCollectionViewCell"
    
    private lazy var contents = UILabel().then {
        $0.textColor = UIColor.gray500
        $0.font = UIFont.ptdRegularFont(ofSize: 16)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.yellow20
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        [contents].forEach{ contentView.addSubview($0) }
    }
    
    private func constraints() {
        contents.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    public func configure(contents: String) {
        self.contents.text = contents
    }
    
    func updateAppearance(isSelected: Bool) {
        contentView.backgroundColor = isSelected ? UIColor.yellow60 : UIColor.yellow20
        contents.textColor = isSelected ? UIColor.gray800 : UIColor.gray500
        contents.font = isSelected ? UIFont.ptdMediumFont(ofSize: 16) : UIFont.ptdRegularFont(ofSize: 16)
    }
}
