//
//  UITextField+Extension.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import Foundation
import UIKit

extension UITextField{

}

class FormTextField: UITextField{
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func configureFormTextField(){
        self.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        self.backgroundColor = StructGlobalColor.color111111
        self.textColor = StructGlobalColor.whiteColor
        self.applyCornerRadius(radius: 10.0)
        self.setBorder(myColor: StructGlobalColor.color444444.cgColor, borderWidth: 1)
    }
}
