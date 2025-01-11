//
//  HomeViewController.swift
//  LunZh
//
//  Created by 이현주 on 1/11/25.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    private let logo = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    // ✅ 뷰 구성 요소 정의 (Then 사용)
    private let label1 = UILabel().then {
        $0.text = "철수 님, 오늘"
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private lazy var label2 = UILabel().then {
        $0.font = UIFont.ptdBoldFont(ofSize: 24)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 16
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 5
        $0.layer.masksToBounds = false
    }
    
    private lazy var notJoinGroupView = NotJoinGroupView().then {
        $0.isHidden = true
    }
    
    private lazy var enterGroupBtn = HomeCustomButton(title: "그레이스",
                                                subTitle: "그룹방에 입장하기",
                                                imageColor: UIColor.gray700,
                                                    backgroundColor: UIColor.yellow60).then {
        $0.isHidden = false
    }
    
    func setupGestures() {
        let btnTapGesture1 = UITapGestureRecognizer(target: self, action: #selector(makeGroupBtnTapped))
        notJoinGroupView.makeGroupBtn.addGestureRecognizer(btnTapGesture1)
        notJoinGroupView.makeGroupBtn.isUserInteractionEnabled = true
        
        let btnTapGesture2 = UITapGestureRecognizer(target: self, action: #selector(joinGroupBtnTapped))
        notJoinGroupView.makeGroupBtn.addGestureRecognizer(btnTapGesture2)
        notJoinGroupView.makeGroupBtn.isUserInteractionEnabled = true
        
        let btnTapGesture3 = UITapGestureRecognizer(target: self, action: #selector(enterGroupBtnTapped))
        enterGroupBtn.addGestureRecognizer(btnTapGesture3)
        enterGroupBtn.isUserInteractionEnabled = true
    }
    
    @objc
    private func makeGroupBtnTapped() {
        let vc = ()
        navigationController?.pushViewController(settingsVC, animated: false)
    }
    
    @objc
    private func joinGroupBtnTapped() {
        
    }
    
    @objc
    private func enterGroupBtnTapped() {
        
    }
    
    // ✅ 데이터 및 타이머 변수
    private var textList = Constants.TasteList
    private let imageNames = ["banner", "banner", "banner"]
    private var currentIndex = 0
    private var timer: Timer?

    // ✅ MARK: - 뷰 로딩
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        configureCollectionView()
        setupTimers()
    }
    
    // ✅ MARK: - 뷰 추가 (addSubview)
    private func setupViews() {
        [logo, collectionView, label1, label2, notJoinGroupView, enterGroupBtn].forEach { view.addSubview($0) }
    }

    // ✅ MARK: - SnapKit 제약 설정
    private func setupConstraints() {
        
        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(25.2)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(Constants.superViewHeight * 0.3)
        }
        
        label1.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(17)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(19)
        }
        
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom)
            make.leading.equalTo(label1.snp.leading)
        }
        
        notJoinGroupView.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(27)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        enterGroupBtn.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(131)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // ✅ MARK: - 컬렉션 뷰 설정
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
    }

    private func setupTimers() {
        // ✅ 첫 번째 텍스트 설정 (노란색 강조)
        updateLabelWithHighlightedText()
        
        // ✅ 텍스트 변경 타이머
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(changeLabelText), userInfo: nil, repeats: true)
        
        // ✅ 배너 자동 슬라이드 타이머
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }

    @objc private func changeLabelText() {
        // ✅ 인덱스 업데이트
        self.currentIndex = (self.currentIndex + 1) % self.textList.count
        updateLabelWithHighlightedText()
    }

    // ✅ 노란색 강조 텍스트를 설정하는 메서드
    private func updateLabelWithHighlightedText() {
        let updatedText = textList[currentIndex]
        let fullText = "\(updatedText) 어떠세요?"
        
        // ✅ AttributedString 설정
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // ✅ 특정 텍스트만 노란색으로 강조
        let range = (fullText as NSString).range(of: updatedText)
        attributedString.addAttributes([
            .foregroundColor: UIColor.systemYellow,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ], range: range)
        
        // ✅ 애니메이션과 함께 텍스트 설정
        UIView.transition(with: label2, duration: 0.8, options: .transitionCrossDissolve, animations: {
            self.label2.attributedText = attributedString
        })
    }


    // ✅ MARK: - 컬렉션 뷰 자동 슬라이드
    @objc private func scrollToNextItem() {
        if currentIndex < imageNames.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}

// ✅ MARK: - UICollectionViewDataSource & Delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else {
            fatalError("Failed to dequeue BannerCell")
        }
        cell.configure(with: imageNames[indexPath.item])
        return cell
    }
    
    // ✅ 컬렉션 뷰 셀 크기 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}



