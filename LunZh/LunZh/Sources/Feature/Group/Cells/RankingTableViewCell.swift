//
//  RankingTableViewCell.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import Then
import SnapKit

class RankingTableViewCell: UITableViewCell {
    static let identifier = "RankingTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setView()
        self.constraints()
        self.addStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.ranking.text = nil
        self.name.text = nil
        self.menu.text = nil
    }
    
    private lazy var tropyIcon = UIImageView().then{
        $0.image = UIImage(named: "ranking1")
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var ranking = UILabel().then{
        $0.text = "1"
        $0.textColor = Constants.Colors.gray600
        $0.font = UIFont.ptdMediumFont(ofSize: 14)
    }
    
    private lazy var name = UILabel().then{
        $0.text = "이름"
        $0.textColor = Constants.Colors.gray800
        $0.font = UIFont.ptdBoldFont(ofSize: 18)
    }
    
    private lazy var menu = UILabel().then{
        $0.text = "메뉴명"
        $0.textColor = Constants.Colors.gray600
        $0.font = UIFont.ptdRegularFont(ofSize: 12)
    }
    
    private lazy var rankingBox = UIView().then{
        $0.backgroundColor = Constants.Colors.yellow60
        $0.layer.cornerRadius = 20
    }
    
    private lazy var nameMenuStack = makeStack()
    
    private func makeStack() -> UIStackView{
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        return stack
    }
    
    private func addStack(){
        [name, menu].forEach(nameMenuStack.addArrangedSubview)
    }
    
    private func setView(){
        [tropyIcon, ranking, nameMenuStack].forEach(rankingBox.addSubview)
        self.addSubview(rankingBox)
    }
    
    private func constraints(){
        tropyIcon.snp.makeConstraints{
            $0.left.equalToSuperview().offset(30)
            $0.centerY.equalToSuperview()
        }
        
        ranking.snp.makeConstraints{
            $0.left.equalTo(tropyIcon.snp.right).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        nameMenuStack.snp.makeConstraints{
            $0.left.equalTo(ranking.snp.right).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        rankingBox.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(72)
        }
        
    }
    
    public func configure(rankingModel: RankingModel){
        self.ranking.text = "\(rankingModel.ranking)"
        if rankingModel.ranking == 1{
            self.tropyIcon.image = UIImage(named: "ranking1")
            self.rankingBox.backgroundColor = Constants.Colors.yellow60
        }else{
            self.tropyIcon.image = UIImage(named: "ranking2")
            self.rankingBox.backgroundColor = Constants.Colors.yellow20
        }
        self.name.text = rankingModel.name
        self.menu.text = rankingModel.menu
    }
}
