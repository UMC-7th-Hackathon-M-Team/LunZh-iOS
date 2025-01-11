//
//  RandomGameViewController.swift
//  LunZh
//
//  Created by 황상환 on 1/12/25.
//

import Foundation
import UIKit

import UIKit

class RandomGameViewController: UIViewController {
    private var randomGameView: RandomGameView!
    private var timer: Timer?
    private let slotItems = ["피자", "떡볶이", "족발", "김밥", "국밥"]
    private let winnerFood: String = "김밥"
    
    let gameService = GameService()
    
    var userId: Int? {
        UserDefaults.standard.object(forKey: "userId") as? Int
    }
    
    var teamId: Int? {
        UserDefaults.standard.object(forKey: "teamId") as? Int
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setupView()
        startSlotMachineAnimation()
        setupTapGesture()
    }

    private func setupView() {
        randomGameView = RandomGameView(frame: self.view.bounds)
        self.view.addSubview(randomGameView)
        
        // FoodLabelTitle 초기 상태: 숨김
        randomGameView.FoodLabelTitle.isHidden = true

        // 3초 후 결과 표시와 함께 나타나게 설정
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.randomGameView.FoodLabelTitle.text = "오늘의 점심은?"
            self.randomGameView.FoodLabelTitle.isHidden = false
            
            // 애니메이션으로 나타나게 처리
            UIView.animate(withDuration: 0.5) {
                self.randomGameView.FoodLabelTitle.alpha = 1.0
            }
        }
    }


    private func startSlotMachineAnimation() {
        // 타이머를 사용해 일정 간격으로 텍스트 변경
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            UIView.transition(with: self.randomGameView.slotLabel, duration: 0.1, options: .transitionFlipFromTop, animations: {
                // 텍스트를 랜덤하게 변경
                self.randomGameView.slotLabel.text = self.slotItems.randomElement()
            }, completion: nil)
        }

        // 3초 후 애니메이션 멈추기
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.stopSlotMachineAnimation()
        }
    }

    private func stopSlotMachineAnimation() {
        timer?.invalidate()
        timer = nil

        // 3초 후 애니메이션 멈추고 `winnerFood` 표시
        randomGameView.slotLabel.text = winnerFood
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc private func handleScreenTap() {
        // 화면 터치 시 화면 닫기
        self.dismiss(animated: true, completion: nil)
    }
}
