//
//  ExitDialogViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class ExitDialogViewController: UIViewController{
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = exitDialogView
        view.backgroundColor = .gray800.withAlphaComponent(0.4)

        // Do any additional setup after loading the view.
        exitDialogView.cancelBtn.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        setupDismissGesture()
    }
    
    private lazy var exitDialogView = ExitDialogView()
    
    private func setupDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    // 모달 외부영역 클릭시 모달 닫기
    @objc private func handleTapOutside(sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if !exitDialogView.containerView.frame.contains(location) {
            dismiss(animated: false, completion: nil)
        }
    }
    
    @objc private func cancelTapped() {
        dismiss(animated: false, completion: nil)
    }

}

// 모달 영역인 containerView가 아닌 영역 클릭시에만 제스처 감지
extension ExitDialogViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        // Ensure the gesture recognizer only triggers for touches not within the containerView
        let location = touch.location(in: exitDialogView.containerView)
        return !exitDialogView.containerView.bounds.contains(location)
    }
}

