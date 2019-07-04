//
//  SHPrelabTrainViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHPrelabTrainViewController: SHViewController {
    
    /// 加快血液流通标准训练
    private let fastingBloodStandPrelab =
        [ "Run", "Swim", "By Bike", "Golf" ]
    
    /// 不允许标准训练
    private let notAlloweStandPrelab = [
        "No Smoking", "Weightlifting", "SKI",
        "Play Basketball", "Boxing"
    ]
    
    /// 功能切换
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    /// 加快血液流通标准训练
    @IBOutlet weak var fastingBloodStandPrelabListView: UICollectionView!
    
    /// 不允许标准训练
    @IBOutlet weak var notAllowStandPrelabListView: UICollectionView!
    
    
    /// 标准训练
    @IBOutlet weak var standPrelabView: UIView!
    
    /// 特殊训练
    @IBOutlet weak var specicalPrelabView: UIView!
    
    
    /// 值点周
    @IBAction func segmentedControlValueChanged() {
        
        standPrelabView.isHidden =
            segmentedControl.selectedSegmentIndex != 0
        
        specicalPrelabView.isHidden =
            segmentedControl.selectedSegmentIndex == 0
    }

    
}

// MARK: - UICollectionViewDataSource
extension SHPrelabTrainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == fastingBloodStandPrelabListView {
            
            return fastingBloodStandPrelab.count
            
        } else if collectionView == notAllowStandPrelabListView {
            
            return notAlloweStandPrelab.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moduleCollectionCellReuseIdentifier, for: indexPath) as! SHModuleCollectionViewCell
        
        if collectionView == fastingBloodStandPrelabListView {
            
            cell.name = fastingBloodStandPrelab[indexPath.item]
            
        } else if collectionView == notAllowStandPrelabListView {
            
            cell.name = notAlloweStandPrelab[indexPath.item]
        }
        
        return cell
    }
    
}

// MARK: - UI初始化
extension SHPrelabTrainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Prelab Train"
        
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
        fastingBloodStandPrelabListView.register(
            UINib(
                nibName: moduleCollectionCellReuseIdentifier,
                bundle: nil),
            forCellWithReuseIdentifier:
            moduleCollectionCellReuseIdentifier
        )
        
        notAllowStandPrelabListView.register(
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
        
        layouFastingBloodStandPrelabListView()
        layouNotAllowStandPrelabListView()
    }
    
    /// 布局 fastingBloodStandPrelabListView
    private func layouFastingBloodStandPrelabListView() {
        
        let totalCols = 3
        
        let itemWidth =
            (fastingBloodStandPrelabListView.width - CGFloat(totalCols)) / CGFloat(totalCols)
        
        let itemHeight =
            fastingBloodStandPrelabListView.height * 0.5
        
        let flowLayout =  fastingBloodStandPrelabListView.collectionViewLayout
            as! UICollectionViewFlowLayout
        
        flowLayout.itemSize =
            CGSize(width: itemWidth, height: itemHeight)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
    
    /// 布局 notallowDietListView
    private func layouNotAllowStandPrelabListView() {
        
        let totalCols = 3
        
        let itemWidth =
            (notAllowStandPrelabListView.width - CGFloat(totalCols)) / CGFloat(totalCols)
        
        let itemHeight =
            notAllowStandPrelabListView.height * 0.5
        
        let flowLayout =
            notAllowStandPrelabListView.collectionViewLayout
                as! UICollectionViewFlowLayout
        
        flowLayout.itemSize =
            CGSize(width: itemWidth, height: itemHeight)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
}
