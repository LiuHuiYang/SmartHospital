//
//  SHMedicalFileViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHMedicalFileViewController: SHViewController {

    private let categories = [
        
        "Checkup History",
        "Blood & Allergen",
        "LAB Test",
        "X-Ray",
        "Patient History"
    ]
    
    /// 日志列表
    @IBOutlet weak var listView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Medical File"
        
        listView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        listView.backgroundColor =
            UIColor.color(withHex: 0x5CA949)
    }
 
}


// MARK: - UITableViewDataSource
extension SHMedicalFileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "UITableViewCell",
                for: indexPath
        )
        
        cell.backgroundColor =
            UIColor.color(withHex: 0x5CA949)
       
        cell.textLabel?.textColor = .white
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
    
    
    
}
