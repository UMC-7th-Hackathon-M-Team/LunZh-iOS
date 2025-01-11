//
//  NicknameViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit

import SnapKit
import Then

class NicknameViewController: UIViewController {

    let navigationBarManager = NavigationBarManager()
    
    let descriptionLabel = UILabel().then {
        $0.text = "닉네임을 입력해 주세요."
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
    }
    
    let nicknameTextField = PaddedTextField(
        padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), placeholder: "닉네임")
    
    let 
    // MARK: - LifeCycle
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
        setupUI()
        setupConstraints()
        setupNavigationBar()
    }
    

    // MARK: - setup
    
    func setupUI() {
        [descriptionLabel, nicknameTextField].forEach{
            view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().inset(20)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
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
}
