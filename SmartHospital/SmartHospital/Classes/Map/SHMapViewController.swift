//
//  SHMapViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHMapViewController: SHViewController {

    /// 任务信息
    private var taskItems = [SHTaskToFlow]()
    
    /// 任务列表
    @IBOutlet weak var taskItemsListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Hospital Map"
        
        showTaskItems()
    }
 

}

// MARK: - 显示排队信息
extension SHMapViewController: UITableViewDataSource {
    
    /// 显示任务列表
    private func showTaskItems() {
        
        // 注册cell
        taskItemsListView.register(
            UINib(nibName: taskItemViewCellReuseIdentifier,
                  bundle: nil),
            forCellReuseIdentifier:
            taskItemViewCellReuseIdentifier
        )
        
        taskItemsListView.rowHeight =
            SHTaskItemTableViewCell.rowHeight
        
        // 加载信息
        loadTaskMessage { (items) in
            
            self.taskItems.append(contentsOf: items)
            
            // 刷新列表
            self.taskItemsListView.reloadData()
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
