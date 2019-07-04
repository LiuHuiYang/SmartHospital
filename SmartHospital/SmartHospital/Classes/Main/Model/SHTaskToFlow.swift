//
//  SHTaskToFlow.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

enum SHTaskToFlowStatus: UInt {
    
    case done
    case queue
    case req   // 不明白什么意思
}


class SHTaskToFlow: NSObject {
    
    /// 序列号
    var sequenceNumber: UInt = 0
    
    /// 房间号
    var roomNumber: String = "Room: "

    /// 需求描述
    var task: String = ""
    
    /// 时间
    var time: String = "??:??"
    
    /// 需求状态
    var status: SHTaskToFlowStatus = .done
}
