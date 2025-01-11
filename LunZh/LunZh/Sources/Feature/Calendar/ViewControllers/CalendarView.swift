//
//  CalendarView.swift
//  LunZh
//
//  Created by 황상환 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class CalendarView: UIView {
    
    let calendarTitleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.ptdBoldFont(ofSize: 16)
        $0.textAlignment = .center
        $0.text = "리포트"
    }
    
    let calendarView = UICalendarView().then {
        $0.wantsDateDecorations = true
        $0.backgroundColor = .red20
        $0.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        $0.tintColor = .gray700  // 선택된 날짜 색상을 검정색으로 변경
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCalendarView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCalendarView()
    }

    private func setupCalendarView() {
        self.addSubview(calendarTitleLabel)
        self.addSubview(calendarView)

        calendarTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20) // 안전 영역 기준 상단 여백
            make.centerX.equalToSuperview() // 화면 중앙 정렬
        }
        
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(calendarTitleLabel.snp.bottom).offset(70) // 제목 아래로 간격 추가
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(450)
        }

        // 둥근 모서리 설정
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true

        // 그림자 추가 (옵션)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 8
    }

}
