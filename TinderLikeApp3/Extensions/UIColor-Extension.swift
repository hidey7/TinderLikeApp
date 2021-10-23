//
//  UIColor-Extension.swift
//  TinderLikeApp3
//
//  Created by 始関秀弥 on 2021/10/23.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return .init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    
}
