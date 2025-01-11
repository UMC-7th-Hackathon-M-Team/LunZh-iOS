// 커스텀 네비게이션 바
// VC 에서 NavigationBarManager 호출
// setupNavBar 함수에서 func 호출

import Foundation
import UIKit

class NavigationBarManager {
    
    // MARK: - Initializer
    init() {}
    
    // MARK: - 왼쪽 커스텀 백버튼 생성
    func addBackButton(
        to navigationItem: UINavigationItem,
        target: Any?,
        action: Selector,
        tintColor: UIColor = .systemGray
    ) {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = tintColor
        backButton.addTarget(target, action: action, for: .touchUpInside)
        backButton.accessibilityLabel = "뒤로 가기"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    // MARK: - 네비게이션 타이틀 설정 (텍스트)
    func setTitle(
        to navigationItem: UINavigationItem,
        title: String? = nil,
        textColor: UIColor = .label,
        font: UIFont = .systemFont(ofSize: 18, weight: .medium)
    ) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = font
        titleLabel.textColor = textColor
        titleLabel.textAlignment = .center
        titleLabel.accessibilityLabel = title
        
        navigationItem.titleView = titleLabel
    }
    
    // MARK: - 네비게이션 타이틀 설정 (로고)
    func setLogoTitle(
        to navigationItem: UINavigationItem,
        logo: Bool
    ) {
        guard logo else { return } // 로고가 필요 없는 경우 함수 종료
        
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "logo")
        logoImageView.accessibilityLabel = "로고"
        
        navigationItem.titleView = logoImageView
    }
    
    // MARK: - 오른쪽 커스텀 버튼 생성
    func addRightButton(
        to navigationItem: UINavigationItem,
        title: String? = nil,
        icon: String? = nil,
        target: Any?,
        action: Selector,
        tintColor: UIColor = .label,
        font: UIFont = .systemFont(ofSize: 16, weight: .medium)
    ) {
        let rightButton = UIButton(type: .system)
        
        if let title = title {
            // 텍스트 버튼
            rightButton.setTitle(title, for: .normal)
            rightButton.setTitleColor(tintColor, for: .normal)
            rightButton.titleLabel?.font = font
            rightButton.accessibilityLabel = title
        } else if let icon = icon {
            // 이미지 버튼
            rightButton.setImage(UIImage(systemName: icon), for: .normal)
            rightButton.tintColor = tintColor
            rightButton.accessibilityLabel = icon
        }
        
        rightButton.addTarget(target, action: action, for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
}


//import UIKit
//
//class MyViewController: UIViewController {
//
//    let navBarManager = NavigationBarManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//
//        // 왼쪽 백 버튼 추가
//        navBarManager.addBackButton(
//            to: navigationItem,
//            target: self,
//            action: #selector(didTapBackButton)
//        )
//
//        // 타이틀 설정
//        navBarManager.setTitle(
//            to: navigationItem,
//            title: "커스텀 네비게이션 바",
//            textColor: .black,
//            font: UIFont.boldSystemFont(ofSize: 18)
//        )

//        // 네비게이션 타이틀에 로고 추가
//        navBarManager.setLogoTitle(
//            to: navigationItem,
//            logo: true
//        )
//
//        // 오른쪽 버튼 추가
//        navBarManager.addRightButton(
//            to: navigationItem,
//            title: "저장",
//            target: self,
//            action: #selector(didTapRightButton),
//            tintColor: .systemBlue
//        )
//    }
//
//    @objc private func didTapBackButton() {
//        print("뒤로 버튼 클릭")
//        // NavigationController pop 동작
//        navigationController?.popViewController(animated: true)
//    }
//
//    @objc private func didTapRightButton() {
//        print("오른쪽 버튼 클릭")
//    }
//}
