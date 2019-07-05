//
//  SHTaskToFlow.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

@objc enum SHTaskToFlowStatus: UInt {
    
    case done
    case queue
    case req   // 不明白什么意思
}

// 使用了 KVC 要 主动加上 @objc
@objcMembers class SHTaskToFlow: NSObject {
    
    /// 序列号
    var sequenceNumber: UInt = 0
    
    /// 房间号
    var roomNumber: String = "Room: "

    /// 需求描述
    var task: String = ""
    
    /// 时间
    var time: String = "??:??"
    
    /// 需求状态
    var status: SHTaskToFlowStatus = .done {
        
        didSet {
            
            switch status {
            
            case .done:
                stateDescription = "Done"
                
            case .queue:
                stateDescription = "Queue"
                
            case .req:
                stateDescription = "Req."
            }
        }
    }
    
    /// 需求状态描述
    var stateDescription: String = ""
    
    // MARK: - 构造
    
    override init() {
        super.init()
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        
        setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        printLog("设置 key: \(key) - value: \(value ?? "") ")
    }
}
