//
//  GameResultView.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit
import SnapKit
import Then

class GameResultView: UIView {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addStackView()
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    private lazy var title1 = UILabel().then{
        $0.text = "오늘의 메뉴는"
        $0.textColor = .black
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
    }
    
    private lazy var menuName = UILabel().then{
        $0.text = "짜장면"
        $0.textColor = Constants.Colors.yellow100
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
    }
    
    private lazy var title2: UILabel = {
        let label = UILabel()
        let fullText = "짜장면 입니다!"
        let attributedString = NSMutableAttributedString(string: fullText)
        let components = fullText.components(separatedBy: " ")
        
        if let firstWord = components.first, let range = fullText.range(of: firstWord) {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: Constants.Colors.yellow100!, range: nsRange)
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 24), range: nsRange)
        }
        
        label.attributedText = attributedString
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
   
    public lazy var rankingTableView = UITableView().then {
        $0.register(RankingTableViewCell.self, forCellReuseIdentifier: RankingTableViewCell.identifier)
        $0.separatorStyle = .none
        
    }
    
    // MARK: - Stack
    private lazy var titleStack = makeStackView()
    
    // MARK: - Function
    private func makeStackView() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }
    // MARK: - add Fuction & Constraints
    
    private func addStackView(){
        [title1, title2].forEach(titleStack.addArrangedSubview)
    }
    private func addComponents(){
        [titleStack, rankingTableView].forEach(self.addSubview)
    }
    
    private func constraints(){
        titleStack.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
            $0.left.equalToSuperview().offset(20)
        }
        
        rankingTableView.snp.makeConstraints {
            $0.top.equalTo(titleStack.snp.bottom).offset(14)
            $0.horizontalEdges.bottom.equalToSuperview().inset(20)
        }
    }

}
