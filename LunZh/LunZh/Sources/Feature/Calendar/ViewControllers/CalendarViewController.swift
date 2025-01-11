//
//  CalendarViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    var customCalendarView: CalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
    }

    private func setupView() {
        customCalendarView = CalendarView(frame: self.view.bounds)
        self.view.addSubview(customCalendarView)

        // 캘린더 델리게이트 설정
        customCalendarView.calendarView.delegate = self
    }

    // 모든 날짜에 햄버거 이모지 표시
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return .customView {
            let label = UILabel()
            label.text = "🍔"
            label.font = UIFont.systemFont(ofSize: 16) // 날짜 크기 조정
            label.textAlignment = .center
            return label
        }
    }

    // 날짜 선택 처리
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents = dateComponents else { return }
        print("Selected date: \(dateComponents)")
        
        customCalendarView.calendarView.tintColor = UIColor.gray700 // 원하는 색상으로 변경

    }
}
