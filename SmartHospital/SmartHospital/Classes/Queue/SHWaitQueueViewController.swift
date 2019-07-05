//
//  SHWaitQueueViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHWaitQueueViewController: SHViewController {

    
    /// 显示信息
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Waitting QUE"
        
        messageLabel.text =
            "  Doctor Name: \n\t Alice Thomas" + "\n \n" +
            "  Departments: \n\t Gynecology" + "\n \n" +
        "  Room NO. 602 7F"
    }
}
