//
//  SHMediacation.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/5.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


/// 单个药品处方说明
@objcMembers class SHMedicine: NSObject {

    /// 开始日期
    var startDate: String = ""
    
    /// 结束日期
    var endDate: String = ""
    
    /// 批量包装形状
    var batchShape: String = ""
    
    /// 单个药物形状
    var singleShape: String = ""
    
    /// 每天次数
    var timesPerDay: String = ""
    
    /// 间隔时间
    var intervalTime: String = ""
    
    /// 使用描述集合
    var useDescriptions = [SHSpecificDosage]()
    
    // MARAK: - 构造
    
    override init() {
        super.init()
    }
    
    /// kvc设置
    init(dictionary: [String: Any]) {
        super.init()
        
        setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "useDescriptions" {
            
            if let array = value as? [[String: Any]] {
                
                var descriptions = [SHSpecificDosage]()
                
                for dict in array {
                    
                    descriptions.append(
                         SHSpecificDosage(
                            dictionary: dict
                        )
                    )
                }
                
                self.useDescriptions = descriptions
            }
            
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        printLog("没有设置 key: \(key) - value: \(value ?? "")")
    }
}
