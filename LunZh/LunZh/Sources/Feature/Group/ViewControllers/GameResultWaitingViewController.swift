//
//  GameResultWaitingViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class GameResultWaitingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameResultWaitingView
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    
    private lazy var gameResultWaitingView = GameResultWaitingView()
    
    

}
