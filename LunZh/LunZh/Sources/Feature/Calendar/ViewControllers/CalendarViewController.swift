//
//  CalendarViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    var customCalendarView: CalendarView!

    let calendarDate: String = "2025-01-11"
    let calendarFood: String = "짜장면"

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

    // 특정 날짜에 특정 음식 이모지 표시
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else { return nil }

        let dateString = String(format: "%04d-%02d-%02d", year, month, day)

        if dateString == calendarDate {
            let emoji = getEmoji(for: calendarFood)
            return .customView {
                let label = UILabel()
                label.text = emoji
                label.font = UIFont.systemFont(ofSize: 16) // 날짜 크기 조정
                label.textAlignment = .center
                return label
            }
        }

        return nil // 다른 날짜에는 표시하지 않음
    }

    // 날짜 선택 처리
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents = dateComponents else { return }
        print("Selected date: \(dateComponents)")
    }

    // 특정 음식에 따른 이모지 반환
    private func getEmoji(for food: String) -> String {
        switch food {
        case "김치찌개", "불고기", "비빔밥", "떡볶이", "삼겹살":
            return "🍚" // 한식
        case "짜장면", "탕수육", "짬뽕", "마파두부", "볶음밥":
            return "🥟" // 중식
        case "파스타", "피자", "햄버거", "스테이크", "리조또":
            return "🍔" // 양식
        case "스시", "라멘", "돈카츠", "우동", "오코노미야키":
            return "🍣" // 일식
        default:
            return "❓" // 알 수 없는 음식
        }
    }
}
