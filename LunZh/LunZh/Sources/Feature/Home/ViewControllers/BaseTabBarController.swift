//
//  BaseTabBarController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit
import SnapKit

class BaseTabBarController: UITabBarController {

    private let floatingButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomTabBar()
        setupViewControllers()
        setupFloatingButton()
    }
    
    // MARK: - 커스텀 탭바 적용
    private func setupCustomTabBar() {
        let customTabBar = CustomTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
    }
    
    // MARK: - 탭 연결 및 뷰컨트롤러 설정
    private func setupViewControllers() {
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .white
        firstVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 0)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .white
        secondVC.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.fill"), tag: 1)
        
        self.viewControllers = [firstVC, secondVC]
    }

    // MARK: - SnapKit을 사용하여 중앙 플로팅 버튼 추가
    private func setupFloatingButton() {
        floatingButton.setImage(UIImage(systemName: "plus"), for: .normal)
        floatingButton.tintColor = .white
        floatingButton.backgroundColor = .systemBlue
        floatingButton.layer.cornerRadius = 31.5
        floatingButton.layer.shadowColor = UIColor.black.cgColor
        floatingButton.layer.shadowOpacity = 0.3
        floatingButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        floatingButton.layer.shadowRadius = 5
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
        
        // SnapKit을 사용하여 탭바에 버튼 추가 및 정렬
        tabBar.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // 탭바의 중앙
            make.top.equalToSuperview().offset(-35) // 약간 위로 올리기
            make.width.height.equalTo(63) // 크기 고정
        }
    }
    
    @objc private func floatingButtonTapped() {
        print("Floating Button Tapped!")
        let alert = UIAlertController(title: "플로팅 버튼", message: "버튼이 눌렸습니다!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
