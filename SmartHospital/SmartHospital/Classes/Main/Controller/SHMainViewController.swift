//
//  SHMainViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/3.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHMainViewController: SHViewController {
     
    /// 任务信息
    private var taskItems = [SHTaskToFlow]()
    
    /// 任务信息列表
    @IBOutlet weak var taskListView: UITableView!
    
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
    
    /// 功能视图
    @IBOutlet weak var foundationView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 设置导航栏
        setupNavigationBar()
        
        // 显示任务信息
        showTaskItems()
      
        // 显示功能模块
        showFoundationModelView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layouFoundationModelView()
    }
}


// MARK: - 显示排队信息
extension SHMainViewController: UITableViewDataSource {
    
    /// 显示任务列表
    private func showTaskItems() {
        
        // 注册cell
        taskListView.register(
            UINib(nibName: taskItemViewCellReuseIdentifier,
                  bundle: nil),
            forCellReuseIdentifier:
                taskItemViewCellReuseIdentifier
        )
        
        taskListView.rowHeight =
            SHTaskItemTableViewCell.rowHeight
        
        // 加载信息
        loadTaskMessage { (items) in
            
            self.taskItems.append(contentsOf: items)
            
            // 刷新列表
            self.taskListView.reloadData()
        }
    }
    
    /// 加载日志信息
    private func loadTaskMessage(_ items: @escaping ([SHTaskToFlow]) -> ()) {
        
        // 模拟网络加载
        DispatchQueue.global().async {
            
            var taskItems = [SHTaskToFlow]()
            
            guard let filePath =
                Bundle.main.path(
                    forResource: "tasks.plist", ofType: nil
                ),
                
                let array = NSArray(
                    contentsOfFile: filePath) as? [[String: Any]] else {
                        
                        return
            }
            
            for dict in array {
                
                let item = SHTaskToFlow(dictionary: dict)
                
                taskItems.append(item)
            }
            
            // 主线程更新信息
            DispatchQueue.main.async(execute: {
                
                // 执行闭包
                items(taskItems)
            })
        }
    }
    
    
    // MARK: - 数据源方法
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: taskItemViewCellReuseIdentifier,
                for: indexPath
            ) as! SHTaskItemTableViewCell
        
        cell.taskItem = taskItems[indexPath.row]
        
        return cell
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
            
        case 2:
            navigationController?.pushViewController(
                SHMediacationViewController(),
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
