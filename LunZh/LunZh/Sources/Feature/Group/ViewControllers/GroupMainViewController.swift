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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = groupMainView
        view.backgroundColor = .white
        
        groupMainView.groupMainAppBar.sharingBtn.addTarget(self, action: #selector(sharingTapped), for: .touchUpInside)
        groupMainView.groupMainBody.gameStartBtn.addTarget(self, action: #selector(gameStartTapped), for: .touchUpInside)
    }
    
    @objc func sharingTapped(){
        let customDialogVC = CustomDialogViewController()
        customDialogVC.modalPresentationStyle = .overFullScreen
        present(customDialogVC, animated: false, completion: nil)
    }
    
    @objc func gameStartTapped(){
        let getMenuVC = GetMenuViewController()
        
        getMenuVC.modalPresentationStyle = .fullScreen
        present(getMenuVC, animated: false, completion: nil)
    }



}
