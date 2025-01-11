//////
//////  MyTasteViewController.swift
//////  LunZh
//////
//////  Created by 이현주 on 1/11/25.
//////
////
////import UIKit
////
////class MyTasteViewController: UIViewController {
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        // Do any additional setup after loading the view.
////    }
////    
////
////    /*
////    // MARK: - Navigation
////
////    // In a storyboard-based application, you will often want to do a little preparation before navigation
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        // Get the new view controller using segue.destination.
////        // Pass the selected object to the new view controller.
////    }
////    */
////
////}
////
////extension MyTasteViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
////    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return cellData.count //cellData 있어야 함!!
////    }
////    
////    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyKindCollectionViewCell.identifier, for: indexPath) as! SurveyKindCollectionViewCell
////        
////        let title = cellData[indexPath.row]
////        cell.configure(contents: title)
////        
////        cell.isSelected = selectedItems.contains(title)
////        cell.updateAppearance(isSelected: cell.isSelected)
////        
////        return cell
////    }
////    
////    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let selectedItem = cellData[indexPath.row]
////        
////        if selectedItems.contains(selectedItem) { //이미 selected된 cell
////            selectedItems.removeAll { $0 == selectedItem }
////        } else {
////            selectedItems.append(selectedItem)
////        }
////        
////        // UI 업데이트
////        collectionView.reloadData()
////        nextButton.isEnabled = selectedItems.count >= 1
////        nextButton.isEnabled(isEnabled: selectedItems.count >= 1)
////    }
////    
////    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        
////        let title = cellData[indexPath.row]
////        let font = UIFont.ptdMediumFont(ofSize: 16)
////        let size = title.size(withAttributes: [.font: font])
////        
////        let padding: CGFloat = 48
////        let cellWidth = size.width + padding
////        
////        return CGSize(width: cellWidth, height: 48)
////    }
////}
//
////
////  NicknameViewController.swift
////  LunZh
////
////  Created by 이현주 on 1/11/25.
////
//
//import UIKit
//
//import SnapKit
//import Then
//
//class NicknameViewController: UIViewController {
//
//    let navigationBarManager = NavigationBarManager()
//    
//    let descriptionLabel = UILabel().then {
//        $0.text = "닉네임을 입력해 주세요."
//        $0.font = UIFont.ptdBoldFont(ofSize: 24)
//    }
//    // MARK: - LifeCycle
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = Constants.Colors.yellow20
//        setupNavigationBar()
//        // Do any additional setup after loading the view.
//    }
//    
//
//    // MARK: - setup
//    
//    func setupUI() {
//        [descriptionLabel].forEach{
//            view.addSubview($0)
//        }
//    }
//    
//    func setupConstraints() {
//        descriptionLabel.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.superViewHeight * 0.3)
//            make.width.equalTo(200)
//            make.centerX.equalToSuperview()
//        }
//    }
//    
//     private func setupNavigationBar() {
//         navigationBarManager.setLogoTitle(to: navigationItem, logo: true)
//         navigationBarManager.addBackButton(
//             to: navigationItem,
//             target: self,
//             action: #selector(backButtonTapped),
//             tintColor: Constants.Colors.gray400!
//         )
//     }
//
//    // MARK: - func
//    @objc private func backButtonTapped() {
//        navigationController?.popViewController(animated: true)
//    }
//}
