 

import UIKit
 
 extension UIButton {
    
//    convenience init?(normalImage: UIImage?, highlightedImage: UIImage?) {
//        
//        self.init()
//        
//        setImage(normalImage, for: .normal)
//        setImage(highlightedImage, for: .highlighted)
//    }
    
    convenience init?(
        title: String = "",
        font: UIFont = UIFont.systemFont(ofSize: 13),
        normalImage: UIImage?,
        highlightedImage: UIImage?,
        addTarget target: Any?,
        action: Selector,
        for event: UIControl.Event
        
    ) {
        
        self.init()
        
        setTitle(title, for: .normal)
        
        titleLabel?.font = font
        
        setImage(normalImage, for: .normal)
        setImage(highlightedImage, for: .highlighted)
        
        addTarget(target, action: action, for: event)
    }
    
    convenience init?(title: String?,
                      font: UIFont?,
                      normalTitieColor: UIColor?,
                      highlightedTitleColor: UIColor?,
                      addTarget target: Any?,
                      action: Selector,
                      for event: UIControl.Event) {
        
        self.init()
        
        setTitle(title, for: .normal)
        titleLabel?.font = font
        
        setTitleColor(normalTitieColor, for: .normal)
        setTitleColor(highlightedTitleColor, for: .highlighted)
        
        addTarget(target, action: action, for: event)
    }
    
   
 }
