//
//  SHTaskItemTableViewCell.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/5.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

/// 重用标示
let taskItemViewCellReuseIdentifier =
    "SHTaskItemTableViewCell"

class SHTaskItemTableViewCell: UITableViewCell {
    
    /// 任务信息
    var taskItem: SHTaskToFlow? {
        
        didSet {
            
            guard let item = taskItem else {
                return
            }
            
            self.taskLabel.text = "\(item.task)"
            
            self.otherMessageLabel.text =
                "Room: \(item.roomNumber)" + "\t" +
                "\(item.time)" + "\t" +
                "\(item.stateDescription)"
        }
    }
    
    
    /// 任务描述
    @IBOutlet weak var taskLabel: UILabel!
    
    /// 其它描述信息
    @IBOutlet weak var otherMessageLabel: UILabel!
    
    
    /// 行高
    static var rowHeight: CGFloat {
        
        return 49
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
