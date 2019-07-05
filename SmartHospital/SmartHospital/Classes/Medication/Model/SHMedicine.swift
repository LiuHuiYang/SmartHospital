//
//  SHMediacation.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/5.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


/// 单个药品处方说明
class SHMedicine: NSObject {

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
    
    // MARAK: - 构造
    
    override init() {
        super.init()
    }
    
    
}
