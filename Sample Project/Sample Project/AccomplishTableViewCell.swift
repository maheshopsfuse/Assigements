//
//  AccomplishTableViewCell.swift
//  Sample Project
//
//  Created by Admin on 06/10/21.
//

import UIKit

class AccomplishTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    static let identifier = "AccomplishTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AccomplishTableViewCell", bundle: nil)
    }
    public func configure(title: String, imgName: UIImage){
        label?.text = title
        img.image = imgName
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
