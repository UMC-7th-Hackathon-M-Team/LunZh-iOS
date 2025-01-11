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
    var vc: UIViewController? = nil
    
    let descriptionLabel = UILabel().then {
        $0.text = "닉네임을\n입력해 주세요!"
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.numberOfLines = 0
    }
    
    let nicknameTextField = PaddedTextField(
        padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), placeholder: "닉네임")
    
    let nextButton = CustomButton(title: "다음", titleColor: .gray500, isEnabled: false)
    
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
        setupActions()
        setupNavigationBar()
    }
    

    // MARK: - setup
    
    func setupUI() {
        [descriptionLabel, nicknameTextField, nextButton].forEach{
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
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    func setupActions(){
        nicknameTextField.addTarget(self, action: #selector(nicknameValidate), for: .editingChanged)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
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
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func nicknameValidate() {
        var isValid: Bool = false
        if let nickname = nicknameTextField.text, !nickname.isEmpty {
            isValid = true
            vc = MyTasteViewController(nickname: nickname)
        } else {
            isValid = false
        }
        nextButton.isEnabled = isValid
        nextButton.isEnabled(isEnabled: isValid)
        
    }
}
