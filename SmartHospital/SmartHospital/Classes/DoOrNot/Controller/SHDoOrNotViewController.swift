//
//  SHDoOrNotViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit



class SHDoOrNotViewController: SHViewController {
      
    /// 允许饮食
    private let allowedDiet = [
        "Cake", "Greens", "Maize",
        "Milk", "Tomato", "Water"
    ]
    
    /// 不允许饮食
    private let notAllowedDiet = [
        "Coffe", "Blackbreey", "Watermelon",
        "Steak", "Hamburger", "Olive"
    ]
    
    /// 功能切换
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    /// 不允许饮食
    @IBOutlet weak var notAllowDietListView: UICollectionView!
    
    /// 允许饮食
    @IBOutlet weak var allowDietListView: UICollectionView!
     
    /// 食物处理
    @IBOutlet weak var dietView: UIView!
    
    /// 药物处理
    @IBOutlet weak var medicationView: UIView!
    
    
    /// 值点化
    @IBAction func segmentedControlValueChanged() {
        
        dietView.isHidden =
            segmentedControl.selectedSegmentIndex != 0
        
        medicationView.isHidden =
            segmentedControl.selectedSegmentIndex == 0
    }
    
}


// MARK: - UICollectionViewDataSource
extension SHDoOrNotViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == allowDietListView {
            
            return allowedDiet.count
        
        } else if collectionView == notAllowDietListView {
            
            return notAllowedDiet.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moduleCollectionCellReuseIdentifier, for: indexPath) as! SHModuleCollectionViewCell
        
        if collectionView == allowDietListView {
            
            cell.name = allowedDiet[indexPath.item]
            
        } else if collectionView == notAllowDietListView {
            
            cell.name = notAllowedDiet[indexPath.item]
        }
        
        return cell
    }
    
}

// MARK: - UI初始化
extension SHDoOrNotViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Do & Not Do"
        
        // 设置选项卡
        segmentedControl.setBackgroundImage(
            UIImage(named: "segmentedbackgroud"),
            for: .normal,
            barMetrics: .default
        )
        
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                UIColor.black,
             NSAttributedString.Key.font:
                UIFont.systemFont(ofSize: 16)
            ],
            
            for: .normal
        )
        
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                UIColor.white
            ],
            
            for: .selected
        )
        
        // 注册cell
        
        allowDietListView.register(
            UINib(
                nibName: moduleCollectionCellReuseIdentifier,
                bundle: nil),
            forCellWithReuseIdentifier:
            moduleCollectionCellReuseIdentifier
        )
        
        notAllowDietListView.register(
            UINib(
                nibName: moduleCollectionCellReuseIdentifier,
                bundle: nil),
            forCellWithReuseIdentifier:
            moduleCollectionCellReuseIdentifier
        )
        
        segmentedControlValueChanged()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layouAllowDietListView()
        layouNotAllowDietListView()
    }
    
    
    /// 布局 allowDietListView
    private func layouAllowDietListView() {
        
        let totalCols = 3
        
        let itemWidth =
            (allowDietListView.width - CGFloat(totalCols)) / CGFloat(totalCols)
        
        let itemHeight = allowDietListView.height * 0.5
        
        let flowLayout = allowDietListView.collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.itemSize =
            CGSize(width: itemWidth, height: itemHeight)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
    
    /// 布局 notallowDietListView
    private func layouNotAllowDietListView() {
        
        let totalCols = 3
        
        let itemWidth =
            (notAllowDietListView.width - CGFloat(totalCols)) / CGFloat(totalCols)
        
        let itemHeight = allowDietListView.height * 0.5
        
        let flowLayout = notAllowDietListView.collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.itemSize =
            CGSize(width: itemWidth, height: itemHeight)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
}
