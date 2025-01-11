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
    private lazy var groupMainView = GroupMainView()
    private lazy var gameResultWaitingView = GameResultWaitingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view = groupMainView
        self.view = gameResultWaitingView
        view.backgroundColor = .white
        
        groupMainView.groupMainAppBar.sharingBtn.addTarget(self, action: #selector(sharingTapped), for: .touchUpInside)
        groupMainView.groupMainBody.gameStartBtn.addTarget(self, action: #selector(gameStartTapped), for: .touchUpInside)
    }
    
    @objc func sharingTapped(){
        let customDialogVC = SharingDialogViewController()
        customDialogVC.modalPresentationStyle = .overFullScreen
        present(customDialogVC, animated: false, completion: nil)
    }
    
    @objc func gameStartTapped(){
        let getMenuVC = GetMenuViewController()
        
        getMenuVC.modalPresentationStyle = .fullScreen
        present(getMenuVC, animated: false, completion: nil)
    }



}
