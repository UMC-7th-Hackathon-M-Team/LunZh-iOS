//
//  BannerCollectionViewCell.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionViewCell"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
