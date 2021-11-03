//
//  UIButton+Extension.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import Foundation
import UIKit

extension UIButton{
    
    func configureCommonButtonStyle(_ title: String?,_ image: UIImage?){
        self.setTitle(nil, for: .normal)
        if let title = title{
            self.setTitle(title, for: .normal)
        }
        if let image = image{
            self.setImage(image, for: .normal)
        }
        self.backgroundColor = StructGlobalColor.color333333
        self.setTitleColor(StructGlobalColor.whiteColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        self.applyCornerRadius(radius: 10.0)
    }
}
