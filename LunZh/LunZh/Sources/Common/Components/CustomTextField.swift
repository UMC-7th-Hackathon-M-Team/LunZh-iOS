import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    // MARK: - Initializer
    init(placeholder: String) {
        super.init(frame: .zero)
        setupUI(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI(placeholder: String) {
        // 기본 설정
        self.placeholder = placeholder
        self.borderStyle = .none
        self.font = UIFont.ptdRegularFont(ofSize: 16) // 적절한 폰트 설정
        self.backgroundColor = Constants.Colors.gray100
        self.layer.cornerRadius = 20
        
        // Placeholder 색상 설정
        let placeholderColor = Constants.Colors.gray500 ?? UIColor.systemGray
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
}
