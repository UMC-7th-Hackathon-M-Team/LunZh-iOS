//
//  GameResultViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class GameResultViewController: UIViewController {
    
    private lazy var gameResultView = GameResultView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = gameResultView
        view.backgroundColor = .white
    }
    
}
