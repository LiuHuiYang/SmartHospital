//
//  SHNavigationController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/3.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 设置字体
        navigationBar.titleTextAttributes = [
            
            NSAttributedString.Key.foregroundColor: UIColor.black as Any,
            NSAttributedString.Key.font:
                UIFont(name: "PingFangSC-Semibold", size: 20) as Any
        ]
    }
    
    
}


// MARK: - 设置统一的返回样式
extension SHNavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
         if children.count > 0 {
            
            let backButton =
                UIButton(
                    normalImage: UIImage(named: "back"),
                    highlightedImage: UIImage(named: "back_highlighted"),
                    addTarget: self,
                    action: #selector(popViewControllerBack),
                    for: .touchUpInside
            ) ?? UIButton()
            
            // 设置返回样式
            viewController.navigationItem.leftBarButtonItem =
                UIBarButtonItem(customView: backButton)
            
        }
        
        super.pushViewController(viewController,
                                 animated: animated
        )
    }
    
    
    /// 子控制器出栈
    @objc private func popViewControllerBack() {
        
        _ = popViewController(animated: true)
    }
 
}
