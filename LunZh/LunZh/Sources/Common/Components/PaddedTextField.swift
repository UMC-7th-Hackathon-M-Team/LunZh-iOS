
////MARK: 사용 예시
////PaddedTextField(padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), placeholder: "")

import UIKit

open class PaddedTextField: UITextField {
    
    public var padding: UIEdgeInsets
    
    // MARK: - Initializer
    public init(padding: UIEdgeInsets, placeholder: String? = nil) {
        self.padding = padding
        super.init(frame: .zero)
        setupUI(placeholder: placeholder)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI(placeholder: String?) {
        // 기본 설정
        self.placeholder = placeholder
        self.borderStyle = .none
        self.font = UIFont.ptdRegularFont(ofSize: 16) // 적절한 폰트 설정
        self.backgroundColor = Constants.Colors.gray100
        self.layer.cornerRadius = 20
        
        // Placeholder 색상 설정
        let placeholderColor = Constants.Colors.gray500 ?? UIColor.systemGray
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
    
    // MARK: - 기본 높이 설정
    override open var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50) // 기본 높이 50 설정
    }
    
    // MARK: - Override Methods for Padding
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
