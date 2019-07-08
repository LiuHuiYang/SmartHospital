//
//  SHSpecificDosage.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/8.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

@objc enum SHSpecificDosageShowType: UInt {
    
    case detail   // 具体指定时间 几点
    case timeSlot // 大致时间 如 早餐 中餐 晚餐
}

/// 药物的具体用量
@objcMembers class SHSpecificDosage: NSObject {
    
    /// 默认指定具体类型
    var showType: SHSpecificDosageShowType = .detail
    
    /// 显示时间段的图片 (morning afternoon evening night)
    var timeIcon: String = ""
    
    /// 使用时间
    var useTime: String = "" // 类showType来决定是显示文字还是图片

    /// 单个药物形状
    var singleShape: String = ""
    
    /// 使用数量
    var quantity: String = "" // X 2

    // MARK: -
    override init() {
        super.init()
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        
        setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        printLog("没有设置 key: \(key) - value: \(value ?? "")")
    }
}

