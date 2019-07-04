 
import UIKit

 extension UIColor {
    
    /// 便利构造 UIColor
    ///
    /// - Parameters:
    ///   - redColor: red【0, 255】
    ///   - greenColor: green【0, 255】
    ///   - blueColor: blue【0, 255】
    ///   - alpha: 透明度 【0， 1】
    convenience init?(redColor: UInt8,
                      greenColor: UInt8,
                      blueColor: UInt8,
                      alpha: CGFloat) {
        
            self.init(red: CGFloat(redColor) / 255.0,
                      green: CGFloat(greenColor) / 255.0,
                      blue: CGFloat(blueColor) / 255.0,
                      alpha: alpha
        )
    }
    
    
    /// 随机颜色
    ///
    /// - Parameter alpha: 透明度 【默认1.0】
    /// - Returns: UIColor
    static func random(_ alpha: CGFloat = 1.0) -> UIColor {
     
        return UIColor(red: CGFloat.random(in: 0 ... 1.0),
                       green: CGFloat.random(in: 0 ... 1.0),
                       blue: CGFloat.random(in: 0 ... 1.0),
                       alpha: alpha
        )
    }
    
    
    /// 依据【十六进制整数】生成颜色 0xRRGGBB
    ///
    /// - Parameters:
    ///   - hex: 十六进制的颜色表示(是整数，不是字符串)
    ///   - alpha: 透明度 【0, 1.0】
    /// - Returns: UIColor
    static func color(withHex hex: UInt32,
                      alpha: CGFloat = 1.0) -> UIColor? {
 
        // 获得各种颜色 255 255 255 ==  #0x ff ff ff
        let red = UInt8((hex & 0xff0000) >> 16)
        let green = UInt8((hex & 0x00ff00) >> 8)
        let blue = UInt8(hex & 0x0000ff)
        
        return
            UIColor(redColor: red,
                    greenColor: green,
                    blueColor: blue,
                    alpha: alpha
        )
    }
  
    
    /// 依据【十六进制字符串】生成颜色 "0xRRGGBB" "#RRGGBB" "#RGB"
    ///
    /// - Parameters:
    ///   - withString: 字符串 "0xRRGGBB"、 "#RRGGBB"、 "#RGB"
    ///   - alpha: 透明度 【0, 1.0】
    static func color(withString string: String,
                      alpha: CGFloat = 1.0) -> UIColor? {
        
        if string.isEmpty {
            return nil
        }
        
        var color =
            string.trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()
        
        // 必须是 # 或者 0x开头
        if color.hasPrefix("0x") == false &&
            color.hasPrefix("#") == false {
            
            return nil
        }
        
        // # 替换成 0x
        if color.hasPrefix("#") {
            
            color = "0x" + String(color.suffix(color.count - 1))
        }
        
        if color.count == 5 {  // 0xF0F/#F0F 类似这种格式
            
            var values = "0x"
            for i in 2 ..< 5 { // 从 0x后面开始
                
                let startIndex =
                    color.index(color.startIndex, offsetBy: i)
                
                let tmp = color[startIndex]
                
                values += "\(tmp)\(tmp)"
            }
            
            color = values
        }
        
        if color.count != 8 {
            
            return nil
        }
        
//        printLog(message: color)
        
        var value: UInt32 = 0
        
        if Scanner(string:color).scanHexInt32(&value) {
             
            return UIColor.color(withHex: value, alpha: alpha)
        }
        
        return nil
    }
 }
