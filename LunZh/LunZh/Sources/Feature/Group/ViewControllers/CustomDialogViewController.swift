//
//  CustomDialogViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/11/25.
//

import UIKit

class CustomDialogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customDialogView
        view.backgroundColor = .black.withAlphaComponent(0.3)
        // Do any additional setup after loading the view.
    }
    
    private lazy var customDialogView = CustomDialogView()
    
    
    
}
