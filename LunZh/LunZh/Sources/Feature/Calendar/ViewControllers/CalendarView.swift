//
//  CalendarView.swift
//  LunZh
//
//  Created by 황상환 on 1/12/25.
//

import UIKit

class CalendarView: UIView {
    let calendarView: UICalendarView = {
        let view = UICalendarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsDateDecorations = true
        view.backgroundColor = .red20
        view.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        view.tintColor = .gray700  // 선택된 날짜 색상을 검정색으로 변경
        
        return view
        }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCalendarView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCalendarView()
    }

    private func setupCalendarView() {
       self.addSubview(calendarView)

       // 캘린더 뷰 레이아웃 설정
       NSLayoutConstraint.activate([
           calendarView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           calendarView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           calendarView.widthAnchor.constraint(equalToConstant: 330),
           calendarView.heightAnchor.constraint(equalToConstant: 450)
       ])
        // 둥근 모서리 설정
        self.layer.cornerRadius = 30 // 둥근 정도 설정
        self.layer.masksToBounds = true

        // 그림자 추가 (옵션)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 8
    }
}



