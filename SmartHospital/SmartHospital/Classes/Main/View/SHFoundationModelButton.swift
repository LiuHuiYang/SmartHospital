//
//  SHFoundationModelButton.swift
//  SmartHospital
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SHFoundationModelButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    /// 设置参数
    private func setup() {
        
        imageView?.contentMode = .scaleAspectFit
        
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        setTitleColor(.black, for: .normal)
        setTitleColor(.gray, for: .highlighted)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let scale: CGFloat = 0.5
        
        imageView?.x = 0
        imageView?.width = width
        imageView?.height = height * scale
        
        imageView?.y = (height * scale) * 0.2
        
        titleLabel?.x = 0
        titleLabel?.width = width
        titleLabel?.y = (imageView?.frame.maxY ?? 0) - 5
        titleLabel?.height = height - (titleLabel?.y ?? 0)
        
//        titleLabel?.backgroundColor = .red
//        imageView?.backgroundColor = .green
    }
}
