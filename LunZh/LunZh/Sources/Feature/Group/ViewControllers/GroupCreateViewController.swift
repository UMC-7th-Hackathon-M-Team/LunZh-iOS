//
//  GroupCreateViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class GroupCreateViewController: UIViewController {
    
    private lazy var groupCreateView = GroupCreateView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = groupCreateView
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
}
