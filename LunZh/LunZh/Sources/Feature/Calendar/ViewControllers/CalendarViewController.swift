//
//  CalendarViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarViewDelegate {
    
    let networkService = HomeService()
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
    var customCalendarView: CalendarView!
    
    // 날짜별 음식 데이터를 저장하는 딕셔너리
    private var foodDataByDate: [String: String] = [:]

    // UserDefaults를 사용한 팀 ID 및 그룹 상태 관리
    var hasGroup: Bool {
        get { UserDefaults.standard.bool(forKey: "hasGroup") }
        set {
            UserDefaults.standard.set(newValue, forKey: "hasGroup")
            if newValue { self.teamId = UserDefaults.standard.integer(forKey: "teamId") }
            else { self.teamId = nil }
        }
    }

    var teamId: Int? {
        get { UserDefaults.standard.object(forKey: "teamId") as? Int }
        set { UserDefaults.standard.set(newValue, forKey: "teamId") }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        
        // 그룹 유무 확인 후 처리
        if !hasGroup {
            applyFullScreenBlur()
        } else if let teamId = teamId {
            fetchCalendarAPI(team: teamId)
        }
    }

    // 캘린더 뷰 및 블러 설정
    private func setupView() {
        customCalendarView = CalendarView(frame: self.view.bounds)
        self.view.addSubview(customCalendarView)
        customCalendarView.calendarView.delegate = self
    }

    private func applyFullScreenBlur() {
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }

    // API 데이터 가져오기 및 업데이트
    func fetchCalendarAPI(team: Int) {
        networkService.getCalendarInfo(data: team) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let responseData):
                DispatchQueue.main.async {
                    self.updateCalendar(with: responseData)
                }
            case .failure(let error):
                print("❌ 네트워크 오류: \(error.localizedDescription)")
            }
        }
    }

    // 받아온 데이터로 캘린더 뷰 업데이트
    private func updateCalendar(with responseData: [CalendarInfoResponseDTO]) {
        for foodData in responseData {
            foodDataByDate[foodData.date] = foodData.food
        }
        customCalendarView.calendarView.reloadDecorations(forDateComponents: [], animated: true)
    }

    // 특정 날짜에 음식 이모지 표시 (1월 12일 하드코딩 추가)
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else { return nil }
        
        let dateString = String(format: "%04d-%02d-%02d", year, month, day)

        if year == 2025 && month == 1 && day == 12 {
            return .customView {
                let label = UILabel()
                label.text = "🍔"
                label.font = UIFont.systemFont(ofSize: 16)
                label.textAlignment = .center
                return label
            }
        }

        // 기존 음식 데이터가 있는 경우
        if let foodName = foodDataByDate[dateString] {
            let emoji = getEmoji(for: foodName)
            return .customView {
                let label = UILabel()
                label.text = emoji
                label.font = UIFont.systemFont(ofSize: 16)
                label.textAlignment = .center
                return label
            }
        }
        return nil
    }

    // 음식 이름에 따라 이모지 변환
    private func getEmoji(for food: String) -> String {
        switch food {
        case "김치찌개", "불고기", "비빔밥", "떡볶이", "삼겹살": return "🍚"
        case "짜장면", "탕수육", "짬뽕", "마파두부", "볶음밥": return "🥟"
        case "파스타", "피자", "햄버거", "스테이크", "리조또": return "🍔"
        case "스시", "라멘", "돈카츠", "우동", "오코노미야키": return "🍣"
        default: return "❓"
        }
    }
}
