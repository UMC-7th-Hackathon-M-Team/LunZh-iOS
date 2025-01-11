//
//  GroupCreateViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class GroupCreateViewController: UIViewController {
    
    private lazy var groupCreateView = GroupCreateView()
    let navigationBarManager = NavigationBarManager()
    let groupService = GroupService()
    var teamId: String = "" {
        didSet {
            saveTeam(teamId: teamId)
        }
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
        self.view = groupCreateView
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        self.groupCreateView.groupCreateBtn.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        setupNavigationBar()
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
    
    func saveTeam(teamId : String) {
        // 로그아웃 시, 이 데이터 모두 삭제
        UserDefaults.standard.set(teamId, forKey: "teamId")
        
        UserDefaults.standard.set(true, forKey: "hasGroup")
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func createButtonTapped(){
        self.groupService.postGroup(email: "junho8917@hanmail.net", name:self.groupCreateView.groupNameInputBox.text!) { [weak self] result in
            guard let self = self else { return }
                        
            switch result {
            case .success(let response):
                print(response)
                self.teamId = "\(response.id)"
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
