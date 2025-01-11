//
//  GetMenuViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class GetMenuViewController: UIViewController {
    private lazy var getMenuView = GetMenuView()
    let navigationBarManager = NavigationBarManager()
    let gameService = GameService()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = getMenuView
        view.backgroundColor = .white
        
        setupNavigationBar()
        self.getMenuView.menuGameStartBtn.addTarget(self, action: #selector(menuGameStartBtnTapped), for: .touchUpInside)
       
    }
    
    private func setupNavigationBar() {
       navigationBarManager.setLogoTitle(to: navigationItem, logo: true)
       navigationBarManager.addBackButton(
           to: navigationItem,
           target: self,
           action: #selector(backButtonTapped),
           tintColor: Constants.Colors.gray400!
       )
   }
    
    
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func menuGameStartBtnTapped() {
        self.gameService.gameStart(teamId: 7, memeberId: 4){ [weak self] result in
            guard let self = self else { return }
                        
            switch result {
            case .success(let response):
                print(response)
                let gameMainVC = GameMainViewController()
                gameMainVC.foodName = self.getMenuView.menuInputBox.text!
                print("넘겨준 넘버는 \(response.game)")
                if(response.game == "A"){
                    gameMainVC.gameNumber = 1
                }else if(response.game == "B"){
                    gameMainVC.gameNumber = 2
                }else if(response.game == "C"){
                    gameMainVC.gameNumber = 3
                }
                //gameMainVC.gameNumber = response.game
                
                navigationController?.pushViewController(gameMainVC, animated: true)
            case .failure(let error):
                print(error)
            }
        }
    
    }
    
}
