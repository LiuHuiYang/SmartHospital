//
//  SHSettingViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/3.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHSettingViewController: SHViewController {
    
    
    /// 服务器地址
    @IBOutlet weak var serverAdressTextField: UITextField!
    
    
    /// 服务器端口
    @IBOutlet weak var serverPortTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"
    }

 
}


// MARK: - UITextField
extension SHSettingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == serverAdressTextField {
            serverAdressTextField.resignFirstResponder()
            serverPortTextField.becomeFirstResponder()
        
        } else if textField == serverPortTextField {
        
            view.endEditing(true)
        }
        
        return true
    }
}
