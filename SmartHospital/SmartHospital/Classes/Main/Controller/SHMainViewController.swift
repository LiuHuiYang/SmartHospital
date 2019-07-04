//
//  SHMainViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/3.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHMainViewController: SHViewController {
    
    
    /// 功能视图
    @IBOutlet weak var foundationView: UIView!
    
    /// 功能模块图片
    private lazy var modules = [
        "Map",
        "Waiting QUE",
        "Current Medication",
        "Appointment",
        "Medical File",
        "Do & Do Not",
        "Humen Body",
        "Prelab Train",
        "Symptoms"
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 设置导航栏
        setupNavigationBar()
        
        var array = [SHTaskToFlow]()
        // 显示信息
        for i in 0 ..< 5 {
            
            let task = SHTaskToFlow()
            
            task.task = "General Checkup"
//            task.sequenceNumber = UInt(i + 1)
//            task.roomNumber = "Room: B11"
//            task.time = "11:30"
//            task.status = .done
            
            array.append(task)
        }
        
      
        // 显示功能模块
        showFoundationModelView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layouFoundationModelView()
    }
}


// MARK: - 显示功能模块
extension SHMainViewController {
    
    /// 按钮点击
    @objc private func foundationModelButtonClick(_ button: UIButton) {
        
        switch button.tag - 1 {
        case 0: 
            navigationController?.pushViewController(
                SHMapViewController(),
                animated: true
            )
            break
            
        case 1: 
            navigationController?.pushViewController(
                SHWaitQueueViewController(),
                animated: true
            )
            
        case 3:
            navigationController?.pushViewController(
                SHAppointmentViewController(),
                animated: true
            )
            
        case 4:
            navigationController?.pushViewController(
                SHMedicalFileViewController(),
                animated: true
            )
            
        case 5:
            navigationController?.pushViewController(
                SHDoOrNotViewController(),
                animated: true
            )
            
        case 6: 
            navigationController?.pushViewController(
                SHHumenBodyViewController(),
                animated: true
            )
            
        case 7:
            navigationController?.pushViewController(
                SHPrelabTrainViewController(),
                animated: true
            )
            
        case 8:
            navigationController?.pushViewController(
                SHSymptomsViewController(),
                animated: true
            )
            
        default:
            break
        }
    }
    
    /// 显示功能模块
    private func showFoundationModelView() {
        
        // 九宫格创建
        for index in 0 ..< modules.count {
            
            let button =
                SHFoundationModelButton(
                    title: modules[index],
                    font: UIFont.systemFont(ofSize: 16),
                    normalImage:
                        UIImage(
                            named: "Main \(modules[index])"),
                    highlightedImage: nil,
                    addTarget: self,
                    action:
                        #selector(foundationModelButtonClick),
                    for: .touchUpInside
                ) ?? UIButton()
            
            button.tag = index + 1
            
            button.setBackgroundImage(
                UIImage(
                    named: "main_background_\(index + 1)"),
                for: .normal
            )
            
            foundationView.addSubview(button)
        }
    }
    
    /// 布局功能按钮
    private func layouFoundationModelView() {
        
        // 设置为3列
        let cols = 3;
        let count = modules.count
        
        let rows =
            count / cols +
            (count % cols == 0 ? 0 : 1)
        
        let width =
            foundationView.frame.width / CGFloat(cols)
        
        let height =
            foundationView.frame.height / CGFloat(rows)
        
        for index in 0 ..< count {
            
            let button = foundationView.subviews[index]
            
            let row = index / cols
            let col = index % cols
            
            button.frame =
                CGRect(x: width * CGFloat(col),
                       y: height * CGFloat(row),
                       width: width,
                       height: height
            )
        }
    }
}

// MARK: - 导航栏设置
extension SHMainViewController {
    
    /// 设置导航样样式
    private func setupNavigationBar() {
        
        navigationItem.title = "Smart Hospital"
        
        let logoButton =
            UIButton(
                normalImage: UIImage(named: "home"),
                highlightedImage:
                    UIImage(named: "home_highlighted"),
                addTarget: self,
                action: #selector(homeLogoButtonClick),
                for: .touchUpInside
            ) ?? UIButton()
        
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(customView: logoButton)
        
        // 设置右边的设置
        let settingButton =
            UIButton(
                normalImage: UIImage(named: "setting"),
                highlightedImage: UIImage(named: "setting"),
                addTarget: self,
                action: #selector(homeSettingButtonClick),
                for: .touchUpInside
            ) ?? UIButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingButton)
    }
    
    
    /// logo图标点击
    @objc private func homeLogoButtonClick() {
        
    }
    
    /// 首页设置点击
    @objc private func homeSettingButtonClick() {
        
        navigationController?.pushViewController(
            SHSettingViewController(),
            animated: true
        )
    }
}
