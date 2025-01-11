//
//  RankingTableViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class RankingTableViewController: UIViewController {
    private let data = dummyRankingModel.rankingItems
    
    private lazy var gameResultView = GameResultView().then{
        $0.rankingTableView.dataSource = self
        $0.rankingTableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameResultView
        view.backgroundColor = .white
    }

}

extension RankingTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.identifier, for: indexPath) as? RankingTableViewCell else { return UITableViewCell() }
        
        
        cell.configure(rankingModel: data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
