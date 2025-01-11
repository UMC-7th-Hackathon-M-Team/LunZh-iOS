//
//  GroupMainViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit
import SnapKit
import Then
class GroupMainViewController: UIViewController {
    
    private lazy var isGameResultLoading: Bool = true
    private lazy var groupMainView = GroupMainView()
    private lazy var gameResultWaitingView = GameResultWaitingBodyView()
    let navigationBarManager = NavigationBarManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = groupMainView
        //self.view = gameResultWaitingView
        view.backgroundColor = .white
        
        
        groupMainView.groupMainAppBar.sharingBtn.addTarget(self, action: #selector(sharingTapped), for: .touchUpInside)
        groupMainView.groupMainAppBar.exitBtn.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        groupMainView.groupMainAppBar.backBtn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        groupMainView.groupMainBody.menuSelectBtn.addTarget(self, action: #selector(menuSelectTapped), for: .touchUpInside)
        setupNavigationBar()
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
    
    @objc func sharingTapped(){
        let sharingDialogVC = SharingDialogViewController()
        sharingDialogVC.modalPresentationStyle = .overFullScreen
        present(sharingDialogVC, animated: false, completion: nil)
    }
    
    @objc func exitTapped(){
        let exitDialogVC = ExitDialogViewController()
        exitDialogVC.modalPresentationStyle = .overFullScreen
        present(exitDialogVC, animated: false, completion: nil)
    }
    
    @objc func menuSelectTapped(){
        let getMenuVC = GetMenuViewController()
        
        navigationController?.pushViewController(getMenuVC, animated: true)
    }
    
    


}
