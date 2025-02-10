//
//  UIView+Extensions.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 21/12/21.
//

import UIKit

extension UIView{
    
    func round(_ radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
    func shadowWithRound(
        _ radius: CGFloat? = nil,
        color: UIColor = UIColor.black,
        shadowRadius: CGFloat = 5,
        shadowOpacity: Float = 0.5,
        shadowOffset: CGSize = .zero
    ) {
        let cornerRadious = radius ?? self.frame.height / 2
        layer.cornerRadius = cornerRadious
        layer.masksToBounds = false
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowColor = color.cgColor
    }
    
    func roundPerticularSide(with CACornerMask: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [CACornerMask]
    }
}

extension NSObject {
    
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
