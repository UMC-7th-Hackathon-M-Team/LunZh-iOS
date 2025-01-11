//
//  LoginViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit
import SnapKit
import Then

import KakaoSDKUser

class LoginViewController: UIViewController {
    
    lazy var kakaoAuthVM: KakaoAuthVM = KakaoAuthVM()
    
    let networkService = AuthService()
    
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "logo") // 이미지 이름으로 초기화
        $0.contentMode = .scaleAspectFill // 이미지 비율 유지
    }
    
    let welcomeLabel = UILabel().then{
        $0.text = "런지와 함께\n설레는 식사를 준비해 보세요!"
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.textColor = Constants.Colors.gray800
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    let kakaoButton = UIButton().then {
        $0.backgroundColor = UIColor(hex: "#FEE500")
        $0.setTitle("카카오로 시작하기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor(hex: "#191919"), for: .normal)
        $0.layer.cornerRadius = 20
        
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.white
        
        if navigationController == nil {
            let navigationController = UINavigationController(rootViewController: self)
            navigationController.modalPresentationStyle = .fullScreen
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
                keyWindow.rootViewController?.present(navigationController, animated: true)
            }
        }
        
        self.navigationController?.isNavigationBarHidden = true
        
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    
    // MARK: - Set Up UI
    func setupUI() {
        [logoImageView, welcomeLabel, kakaoButton].forEach{
            view.addSubview($0)
        }
        
        if let image = UIImage(named: "kakao")?.withRenderingMode(.alwaysOriginal) {
            let resizedImage = resizeImage(image: image, targetHeight: 24)
            kakaoButton.setImage(resizedImage, for: .normal)
        }
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.superViewHeight * 0.3)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(100) // 로고 아래 위치
            make.centerX.equalToSuperview() // 가로 정렬
        }
        kakaoButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20) // 안전 영역과 20pt 간격
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(70) // 버튼 높이
        }
    }
    
    func setupActions(){
        kakaoButton.addTarget(self, action: #selector(kakaoButtonTapped), for: .touchUpInside)
    }
    
    func resizeImage(image: UIImage, targetHeight: CGFloat) -> UIImage {
        let aspectRatio = image.size.width / image.size.height
        let targetSize = CGSize(width: targetHeight * aspectRatio, height: targetHeight)
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    // MARK: - Actions
    @objc private func kakaoButtonTapped() {
        self.kakaoAuthVM.kakaoLogin { success in
            if success {
                UserApi.shared.me { (user, error) in
                    if let error = error {
                        print("에러 발생: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let userIDString = user?.id else {
                        print("user id가 nil입니다.")
                        return
                    }
                    guard let userEmail = user?.kakaoAccount?.email else {
                        print("userEmail가 nil입니다.")
                        return
                    }
                    guard let userProfile = user?.kakaoAccount?.profile?.profileImageUrl else {
                        print("userProfile이 nil입니다.")
                        return
                    }
                    self.kakaoLoginProceed(userEmail: userEmail)
                    let userProfileURL = "\(userProfile)"
                    self.saveUser(userImage: userProfileURL, userEmail: userEmail)
                    UserDefaults.standard.set(userProfile, forKey: "userProfile")
                }
            } else {
                print("카카오 회원가입 실패")
            }
        }
    }
    
    
    private func kakaoLoginProceed(userEmail: String) {
        self.networkService.login(email: userEmail) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                print("카카오 로그인 성공")
                self.saveUserId(userId: response.id)
                self.goToNextView(response.isFirstLogin)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func goToNextView(_ isFirstLogin: Bool) {
        if !isFirstLogin {
            let enterNicknameTestViewController = NicknameViewController()
            navigationController?.pushViewController(enterNicknameTestViewController, animated: true)
        } else {
            let homeViewController = BaseTabBarController()
            navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    
    func saveUserId(userId : Int) {
        // 로그아웃 시, 이 데이터 모두 삭제
        let userIdString = "\(userId)"
        UserDefaults.standard.set(userId, forKey: "userId")
    }
    
    func saveUser(userImage: String, userEmail: String) {
        let userImageString = "\(userImage)"
        UserDefaults.standard.set(userImageString, forKey: "userImage")
        
        let userEmailString = "\(userEmail)"
        UserDefaults.standard.set(userEmailString, forKey: "userEmail")
    }
}
