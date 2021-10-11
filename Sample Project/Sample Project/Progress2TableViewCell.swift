//
//  Progress2TableViewCell.swift
//  Sample Project
//
//  Created by Admin on 08/10/21.
//

import UIKit

class Progress2TableViewCell: UICollectionViewCell {
    static let identifier = "Progress2TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "Progress2TableViewCell", bundle: nil)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
