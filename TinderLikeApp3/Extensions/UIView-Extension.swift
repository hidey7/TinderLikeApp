//
//  UIView-Extension.swift
//  TinderLikeApp3
//
//  Created by 始関秀弥 on 2021/10/23.
//

import UIKit

extension UIView {
    func removeMoveViewAnimation(x: CGFloat, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
            
            let degree: CGFloat = x / 40
            let angle = degree * .pi / 180
            
            let rotateTranslation = CGAffineTransform(rotationAngle: angle)
            self.transform = rotateTranslation.translatedBy(x: x, y: 100)
            self.layoutIfNeeded()
            
        } completion: { _ in
            self.removeFromSuperview()
            if let completion = completion {
                completion()
            }
            
        }
        
    }
}
