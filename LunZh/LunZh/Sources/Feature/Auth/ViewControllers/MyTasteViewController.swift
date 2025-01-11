//
//  MyTasteViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

import SnapKit
import Then

class MyTasteViewController: UIViewController {
    
    let navigationBarManager = NavigationBarManager()
    let authManager = AuthService()
    
    let cellData = Constants.TasteList
    var selectedItems: [String] = []
    
    let nickname: String
    
    let descriptionLabel = UILabel().then {
        $0.text = "관심 있는 음식을\n선택해 주세요!"
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.numberOfLines = 0
    }
    
    lazy var tasteKindCollectionView = UICollectionView(frame: .zero, collectionViewLayout: LeftAlignedCollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 8
    }).then {
        $0.register(TasteCollectionViewCell.self, forCellWithReuseIdentifier: TasteCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.allowsMultipleSelection = true
        $0.clipsToBounds = false
    }
    
    let nextButton = CustomButton(title: "다음", titleColor: .gray500, isEnabled: false)
    
    // MARK: - LifeCycle
    init(nickname: String) {
        self.nickname = nickname
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.white
        tasteKindCollectionView.dataSource = self
        tasteKindCollectionView.delegate = self
        setupUI()
        setupConstraints()
        setupActions()
        setupNavigationBar()
    }
    
    
    // MARK: - setup
    
    func setupUI() {
        [descriptionLabel, tasteKindCollectionView, nextButton].forEach{
            view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().inset(20)
        }
        tasteKindCollectionView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(400)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    func setupActions(){
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        //        nicknameTextField.addTarget(self, action: #selector(nicknameValidate), for: .editingChanged)
    }
    
    private func setupNavigationBar() {
        navigationBarManager.setLogoTitle(to: navigationItem, logo: true)
        navigationBarManager.addBackButton(
            to: navigationItem,
            target: self,
            action: #selector(backButtonTapped),
            tintColor: Constants.Colors.gray400!
        )
    }
    
    // MARK: - func
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func nextButtonTapped() {
        self.authManager.postMemberInfo(memberId: 8, nickName: nickname, preferFood: selectedItems){ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print("멤버 정보 fetch")
                let vc = BaseTabBarController()
                self.navigationController?.pushViewController(vc, animated: true)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}

extension MyTasteViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count //cellData 있어야 함!!
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasteCollectionViewCell.identifier, for: indexPath) as! TasteCollectionViewCell
        
        let title = cellData[indexPath.row]
        cell.configure(contents: title)
        
        cell.isSelected = selectedItems.contains(title)
        cell.updateAppearance(isSelected: cell.isSelected)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = cellData[indexPath.row]
        
        if selectedItems.contains(selectedItem) { //이미 selected된 cell
            selectedItems.removeAll { $0 == selectedItem }
        } else {
            selectedItems.append(selectedItem)
        }
        
        // UI 업데이트
        collectionView.reloadData()
        nextButton.isEnabled = selectedItems.count >= 1
        nextButton.isEnabled(isEnabled: selectedItems.count >= 1)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let title = cellData[indexPath.row]
        let font = UIFont.ptdMediumFont(ofSize: 16)
        let size = title.size(withAttributes: [.font: font])
        
        let padding: CGFloat = 48
        let cellWidth = size.width + padding
        
        return CGSize(width: cellWidth, height: 48)
    }
}
