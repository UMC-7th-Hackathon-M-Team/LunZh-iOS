//
//  GroupMainViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

class GroupMainViewController: UIViewController {
    private lazy var groupMainView: GroupMainView = {
        let groupMainView = GroupMainView()
        groupMainView.translatesAutoresizingMaskIntoConstraints = false
        
        return groupMainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = groupMainView
        view.backgroundColor = .white
        
        groupMainView.groupMainAppBar.sharingBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        print("sharingBtn tapped")
        debugPrint("Button is tapped")
    }

}
