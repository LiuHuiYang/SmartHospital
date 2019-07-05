//
//  SHMediactionCollectionViewCell.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/5.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHMediactionCollectionViewCell: UICollectionViewCell {
    
    
    /// 药物处方
    var medicine: SHMedicine? {
    
        didSet {
            
            if medicine == nil {
                return
            }
            
            startDateLabel.text =
                "Start Date: " + medicine!.startDate
            
            endDateLabel.text =
                "End Date: " + medicine!.endDate
            
            betchShadeLabel.text = medicine!.batchShape
            
            let betchShapeIconName =
                medicine!.batchShape.replacingOccurrences(
                    of: " ",
                    with: "_"
                ).lowercased()
            
            betchShapeImageView.image =
                UIImage(named: betchShapeIconName)
             
            singleShadeLabel.text = medicine!.singleShape
            
            let singleShapeIconName =
                medicine!.singleShape.replacingOccurrences(
                    of: " ",
                    with: "_"
                    ).lowercased()
            
            singleShapeImageView.image =
                UIImage(named: singleShapeIconName)
            
            timesPerDayLabel.text = medicine!.timesPerDay
            intervalTimeLabel.text = medicine!.intervalTime
            
            
        }
    }
    
    
    /// 开始时间
    @IBOutlet weak var startDateLabel: UILabel!
    
    /// 结束时间
    @IBOutlet weak var endDateLabel: UILabel!
    
    /// 批量包装图形
    @IBOutlet weak var betchShapeImageView: UIImageView!
    
    /// 批量包装文字说明
    @IBOutlet weak var betchShadeLabel: UILabel!
    
    /// 单个包装图形
    @IBOutlet weak var singleShapeImageView: UIImageView!
    
    /// 单个包装文字说明
    @IBOutlet weak var singleShadeLabel: UILabel!
    
    /// 每天次数
    @IBOutlet weak var timesPerDayLabel: UILabel!
    
    /// 间隔时间
    @IBOutlet weak var intervalTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        
    }

}
