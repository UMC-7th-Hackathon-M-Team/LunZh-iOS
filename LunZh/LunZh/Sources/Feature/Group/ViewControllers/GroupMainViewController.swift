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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = groupMainView
        //self.view = gameResultWaitingView
        view.backgroundColor = .white
        
        groupMainView.groupMainAppBar.sharingBtn.addTarget(self, action: #selector(sharingTapped), for: .touchUpInside)
        groupMainView.groupMainAppBar.exitBtn.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        
        //groupMainView.groupMainBody.gameStartBtn.addTarget(self, action: #selector(gameStartTapped), for: .touchUpInside)
        
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
    
    @objc func gameStartTapped(){
        let getMenuVC = GetMenuViewController()
        
        getMenuVC.modalPresentationStyle = .fullScreen
        present(getMenuVC, animated: false, completion: nil)
    }
    
    


}
