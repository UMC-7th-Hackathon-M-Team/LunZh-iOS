//
//  GroupCodeInputDialogViewController.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import UIKit

class GroupCodeInputDialogViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = groupCodeInputDialogView
        view.backgroundColor = .gray800.withAlphaComponent(0.4)
        
        groupCodeInputDialogView.codeInputBox.delegate = self
        //groupCodeInputDialogView.codeInputBox.addTarget(self, action: #selector(codeValidate), for: .editingChanged)
    }
    
    private lazy var groupCodeInputDialogView = GroupCodeInputDialogView()
    
    
}

extension GroupCodeInputDialogViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var status: Bool = false
        if let code = textField.text, !code.isEmpty {
            status = true
        }else{
            status = false
        }
        groupCodeInputDialogView.confirmBtn.isEnabled = status
        groupCodeInputDialogView.confirmBtn.isEnabled(isEnabled: status)
        return true
    }
}
