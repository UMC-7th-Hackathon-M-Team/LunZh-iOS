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
        
        selectedIndex = 1
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 기존 탭바 프레임을 가져와 높이를 조정
        var tabFrame = tabBar.frame
        tabFrame.size.height = 90 // 높이 증가
        tabFrame.origin.y = view.frame.height - 90 // 위치 조정
        tabBar.frame = tabFrame
    }
    
    // MARK: - 커스텀 탭바 적용
    private func setupCustomTabBar() {
        let customTabBar = CustomTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
        tabBar.tintColor = UIColor.yellow100
        tabBar.unselectedItemTintColor = UIColor.gray400
    }
    
    // MARK: - 탭 연결 및 뷰컨트롤러 설정
    private func setupViewControllers() {
        let firstVC = CalendarViewController()
        firstVC.view.backgroundColor = .white
        let calendar = UIImage(systemName: "chart.bar.fill")?.resize(by: 1.7)
        firstVC.tabBarItem = UITabBarItem(title: "", image: calendar, tag: 0)
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
        
        let floatingVC = HomeViewController()
        floatingVC.view.backgroundColor = .white
        floatingVC.tabBarItem = UITabBarItem(title: "", image: UIImage(), tag: 1)
        
        let secondVC = RankingTableViewController()
        secondVC.view.backgroundColor = .white
        let person = UIImage(systemName: "person.fill")?.resize(by: 1.7)
        secondVC.tabBarItem = UITabBarItem(title: "", image: person, tag: 2)
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 20)
        
        self.viewControllers = [firstVC, floatingVC, secondVC]
    }

    // MARK: - SnapKit을 사용하여 중앙 플로팅 버튼 추가
    private func setupFloatingButton() {
        floatingButton.setImage(UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButton.tintColor = .white
        floatingButton.backgroundColor = .clear
        floatingButton.layer.cornerRadius = 31.5
        floatingButton.layer.shadowColor = UIColor.black.cgColor
        floatingButton.layer.shadowOpacity = 0.3
        floatingButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        floatingButton.layer.shadowRadius = 5
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
    
        tabBar.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // 탭바의 중앙
            make.top.equalToSuperview().offset(-35) // 약간 위로 올리기
            make.width.height.equalTo(63) // 크기 고정
        }
    }
    
    @objc private func floatingButtonTapped() {
        selectedIndex = 1
    }
}
