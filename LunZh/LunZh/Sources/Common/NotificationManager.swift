//
//  NotificationManager.swift
//  LunZh
//
//  Created by 황상환 on 1/11/25.
//

import Foundation
import UIKit
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "점심 알림"
        content.body = "점심 시간입니다!"
        content.sound = .default
        
        let calendar = Calendar.current
        let now = Date()
        
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.timeZone = calendar.timeZone
        dateComponents.hour = 23
        dateComponents.minute = 21
        dateComponents.second = 10
        
        // 오늘 날짜의 year, month, day 추가
        let today = calendar.dateComponents([.year, .month, .day], from: now)
        dateComponents.year = today.year
        dateComponents.month = today.month
        dateComponents.day = today.day
        
        // 설정한 시간이 현재 시간보다 이전이면 다음 날로 설정
        if let triggerDate = calendar.date(from: dateComponents),
           triggerDate < now {
            dateComponents.day! += 1
        }
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // 디버깅을 위한 다음 발생 시간 출력
        if let nextTriggerDate = trigger.nextTriggerDate() {
            print("Next notification scheduled for: \(nextTriggerDate)")
        }
        
        let request = UNNotificationRequest(
            identifier: "lunchNotification",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}
