//
//  SHMediacationViewController.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/5.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


/// cell重用标示
private let mediacationViewCellReuseIdentifier =
    "SHMediactionCollectionViewCell"

class SHMediacationViewController: SHViewController {
    
    /// 所有的处方
    private var  medicines = [SHMedicine]()
    
    /// 页面指示器
    @IBOutlet weak var pageControl: UIPageControl!
    
    /// 列表
    @IBOutlet weak var listView: UICollectionView!
     
}


// MARK: - UICollectionViewDelegate
extension SHMediacationViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page =
            Int((scrollView.contentOffset.x +
                0.5 * scrollView.width
            ) / scrollView.width)
        
        pageControl.currentPage = page
    }
}

extension SHMediacationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return medicines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier:
                mediacationViewCellReuseIdentifier,
                    for: indexPath
            ) as! SHMediactionCollectionViewCell
        
        cell.medicine = medicines[indexPath.item]
        
        return cell
    }
}


// MARK: - 获取药品信息
extension SHMediacationViewController {
    
    /// 加载日志信息
    private func loadMediacation(_ medicines: @escaping ([SHMedicine]) -> ()) {
        
        // 模拟网络加载
        DispatchQueue.global().async {
            
            var drugs = [SHMedicine]()
           
            guard let filePath =
                Bundle.main.path(
                    forResource: "useDescriptions.plist", ofType: nil
                ),
                
                let array = NSArray(
                    contentsOfFile: filePath) as? [[String: Any]] else {
                        
                        return
            }
            
            for dict in array {
                
                let item = SHMedicine(dictionary: dict)
                
                drugs.append(item)
            }
            
            // 主线程更新信息
            DispatchQueue.main.async(execute: {
                
                medicines(drugs)
            })
        }
    }
}

// MARK: - UI设置
extension SHMediacationViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        /// 获得药品处方
        loadMediacation { (medicines) in
            
            self.medicines.removeAll(keepingCapacity: true)
            self.medicines.append(contentsOf: medicines)
            
            self.pageControl.numberOfPages = medicines.count
            self.pageControl.currentPage = 0
            self.pageControl.hidesForSinglePage = true
            
            self.listView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Current Mediacation"
        
        // 注册cell
        listView.register(
            UINib(
                nibName: mediacationViewCellReuseIdentifier,
                bundle: nil),
            forCellWithReuseIdentifier:
            mediacationViewCellReuseIdentifier
        )
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let flowLayout =
            listView.collectionViewLayout
                as! UICollectionViewFlowLayout
        
        flowLayout.itemSize = listView.size
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }
}
