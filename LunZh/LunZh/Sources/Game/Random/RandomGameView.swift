//
//  RandomGameView.swift
//  LunZh
//
//  Created by 황상환 on 1/12/25.
//

import Foundation
import UIKit

class RandomGameView: UIView {
    var slotLabel: UILabel!
    
    let EllipseView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow100
        setupEllipseView()
        setupSlotMachine()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.yellow100
        setupEllipseView()
        setupSlotMachine()
    }
    
    private func setupEllipseView() {
        // EllipseView 추가
        EllipseView.image = UIImage(named: "Ellipse_yellow")
        self.addSubview(EllipseView)

        // SnapKit으로 제약 추가
        EllipseView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(400)
        }
    }

    private func setupSlotMachine() {
        // 슬롯머신 라벨 설정
        slotLabel = UILabel()
        slotLabel.textAlignment = .center
        slotLabel.font = UIFont.ptdBoldFont(ofSize: 50)
        slotLabel.backgroundColor = .clear // 라벨 배경 제거
        slotLabel.textColor = .red100

        // 라벨 SnapKit으로 레이아웃 설정
        self.addSubview(slotLabel)
        slotLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }
}
