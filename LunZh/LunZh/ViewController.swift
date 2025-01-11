//
//  ViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class ViewController: UIViewController {
    var slotLabel: UILabel!
    var timer: Timer?
    let slotItems = ["피자", "떡볶이", "족발", "김밥", "국밥"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }


        setupSlotMachine()
        startSlotMachineAnimation()
    }
    
    func setupSlotMachine() {
        // 슬롯머신 박스 설정
        let slotWidth: CGFloat = 200
        let slotHeight: CGFloat = 100
        let slotContainer = UIView(frame: CGRect(x: self.view.center.x - slotWidth / 2,
                                                 y: self.view.center.y - slotHeight / 2,
                                                 width: slotWidth,
                                                 height: slotHeight))
        slotContainer.layer.borderColor = UIColor.black.cgColor
        slotContainer.layer.borderWidth = 2
        slotContainer.layer.cornerRadius = 10
        self.view.addSubview(slotContainer)
        
        // 라벨 추가
        slotLabel = UILabel(frame: CGRect(x: 0, y: 0, width: slotWidth, height: slotHeight))
        slotLabel.textAlignment = .center
        slotLabel.font = UIFont.systemFont(ofSize: 50)
        slotLabel.text = slotItems.randomElement() // 초기 값 설정
        slotContainer.addSubview(slotLabel)
    }
    
    func startSlotMachineAnimation() {
        // 타이머를 사용해 일정 간격으로 텍스트 변경
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            UIView.transition(with: self.slotLabel, duration: 0.1, options: .transitionFlipFromTop, animations: {
                // 텍스트를 랜덤하게 변경
                self.slotLabel.text = self.slotItems.randomElement()
            }, completion: nil)
        }
        
        // 3초 후 애니메이션 멈추기
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.stopSlotMachineAnimation()
        }
    }
    
    func stopSlotMachineAnimation() {
        timer?.invalidate()
        timer = nil
    }
}
