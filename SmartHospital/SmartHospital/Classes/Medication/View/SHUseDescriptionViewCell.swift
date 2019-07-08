//
//  SHUseDescriptionViewCell.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/8.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHUseDescriptionViewCell: UITableViewCell {
    
    /// 使用方法描述
    var useDescription: SHSpecificDosage? {
        
        didSet {
            
            guard let use = useDescription else {
                return
            }
            
            showTimeImageView.image =
                UIImage(named: use.timeIcon)
            
            if use.showType == .detail {
                
                timeLabel.text = use.useTime
                timeImageView.isHidden = true
            
            } else {
                
                timeLabel.isHidden = true
                timeImageView.image =
                    UIImage(named: use.useTime)
            }
            
            detailButton.setImage(
                UIImage(named:
                    use.singleShape.replacingOccurrences(
                        of: " ",
                        with: "_"
                    ).lowercased()),
                
                for: .normal)
            
            detailButton.setTitle(
                use.quantity,
                for: .normal
            )
        }
    }

    
    /// 行高
    static var rowHeight: CGFloat {
        
        return 64
    }
    
    /// 时间段标志
    @IBOutlet weak var showTimeImageView: UIImageView!
    
    
    /// 具体的使用时间
    @IBOutlet weak var timeLabel: UILabel!
   
    /// 时间图片
    @IBOutlet weak var timeImageView: UIImageView!
    
    /// 具体的用量
    @IBOutlet weak var detailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        backgroundColor = .clear
        selectionStyle = .none
        
        detailButton.titleEdgeInsets =
            UIEdgeInsets(top: 0,
                         left: 20,
                         bottom: 0,
                         right: 0
        )
        
        detailButton.imageEdgeInsets =
            UIEdgeInsets(top: 0,
                         left: -20,
                         bottom: 0,
                         right: 0
        )
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
}
