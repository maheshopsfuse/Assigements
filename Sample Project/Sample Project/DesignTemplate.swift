

import Foundation
import UIKit

class DesignTemplate{
    static func buttonDesign(button: UIButton)  {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
    }
}
extension UILabel {
    func addCharacterSpacing(kernValue: Double = 3.0) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}
extension UIButton{
    func buttonDesign(height:Int = 42, align: UIControl.ContentHorizontalAlignment = .center )  {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        frame.size.height = CGFloat(height)
        contentHorizontalAlignment = align
        
        if let titleText = title(for: .normal),  titleText.count > 0 {
            let attributedString = NSMutableAttributedString(string: titleText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 2.0, range: NSRange(location: 0, length: attributedString.length - 1))
            
            //let attributedTitle = NSAttributedString(string: titleText, attributes: [NSAttributedString.Key.kern: 2.0])
            setAttributedTitle(attributedString, for: .normal)
        }
    }
}
extension UITextField{
    func textFieldDesign() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        frame.size.height = 52
        backgroundColor = UIColor.init(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.0)
        textColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
        attributedPlaceholder = NSAttributedString(string: placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 205, green: 205, blue: 205, alpha: 1)])
        font = UIFont(name: text!, size: 17)
    }
}
