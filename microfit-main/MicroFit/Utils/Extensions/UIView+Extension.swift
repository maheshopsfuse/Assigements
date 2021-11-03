//
//  UIView+Extension.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import Foundation
import UIKit

extension UIView{
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func applyShadow(color: UIColor?, opacity: Float = 0.5, offset: CGSize = CGSize(width: 2, height: 2)) {
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shadowColor = color?.cgColor
        layer.shadowOffset = offset
    }
    
    func removeAllShadow(){
        layer.shadowOpacity = 0.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOffset = .zero
    }
    
    func applyCornerRadius(radius: CGFloat = 15.0) {
        layoutIfNeeded()
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setBorder(myColor:CGColor=UIColor.white.cgColor ,borderWidth: CGFloat = 1 ){
        self.layer.borderColor = myColor
        self.layer.borderWidth = borderWidth
    }
    
    func circularView(hasBorder: Bool = true, borderWidth: CGFloat = 2, color: UIColor = .white) {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
        if hasBorder {
            layer.borderWidth = borderWidth
            layer.borderColor = color.cgColor
        }
    }
    
    func circularViewWithWidth(hasBorder: Bool = true, borderWidth: CGFloat = 2, color: UIColor = .white) {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        if hasBorder {
            layer.borderWidth = borderWidth
            layer.borderColor = color.cgColor
        }
    }
    
    func onlyTopCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func onlyBottomCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func setCornerRadiusForShadow(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func onlyTopRightCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMinYCorner]
    }
    
    func onlyTopLeftCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    func onlyBottomLeftCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMaxYCorner]
    }
    
    func onlyBottomRightCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    func onlyTopLeftAndBottomRightCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func onlyTopRightAndBottomLeftCornerRadius(withRadius radius:CGFloat = 10){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }
}
