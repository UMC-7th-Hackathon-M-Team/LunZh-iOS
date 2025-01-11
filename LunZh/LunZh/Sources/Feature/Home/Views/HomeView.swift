//
//  HomeView.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

//import UIKit
//
//class HomeView: UIView {
//    
//    public lazy var title: UILabel = {
//        let l = UILabel()
//        l.text = "Saved"
//        l.textColor = .black
//        l.font = .systemFont(ofSize: 28, weight: .semibold)
//        return l
//    }()
//    
//    public lazy var entire: UILabel = {
//        let l = UILabel()
//        return l
//    }()
//    
//    public lazy var savedTableView: UITableView = {
//        let t = UITableView()
//        t.register(SavedTableViewCell.self, forCellReuseIdentifier: "SavedTableViewCell")
//        t.separatorStyle = .singleLine
//        return t
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        setUpUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setUpUI() {
//        addSubview(title)
//        addSubview(entire)
//        addSubview(savedTableView)
//        
//        title.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide).offset(16)
//            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
//        }
//        
//        entire.snp.makeConstraints { make in
//            make.top.equalTo(title.snp.bottom).offset(16)
//            make.leading.equalTo(safeAreaLayoutGuide).offset(13)
//        }
//        
//        savedTableView.snp.makeConstraints { make in
//            make.top.equalTo(entire.snp.bottom).offset(12)
//            make.leading.trailing.equalTo(safeAreaLayoutGuide)
//            make.bottom.equalTo(safeAreaLayoutGuide)
//        }
//    }
//
//}
