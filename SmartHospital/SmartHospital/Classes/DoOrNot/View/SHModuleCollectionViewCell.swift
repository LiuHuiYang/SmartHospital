//
//  SHModuleCollectionViewCell.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

let moduleCollectionCellReuseIdentifier =
    "SHModuleCollectionViewCell"

class SHModuleCollectionViewCell: UICollectionViewCell {
    
    /// 显示名称
    var name: String? {
        
        didSet {
            
            nameButton .setTitle(name, for: .normal)
            
            nameButton.setImage(
                UIImage(named: name?.lowercased() ?? ""),
                for: .normal
            )
        }
    }

    /// 按钮
    @IBOutlet weak var nameButton: SHFoundationModelButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        
        
    }

}
