//
//  Progress1TableViewCell.swift
//  Sample Project
//
//  Created by Admin on 08/10/21.
//

import UIKit

class Progress1TableViewCell: UICollectionViewCell {
    static let identifier = "Progress1TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "Progress1TableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
