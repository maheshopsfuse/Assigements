//
//  ProfileTableViewCell.swift
//  Sample Project
//
//  Created by Admin on 08/10/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "ProfileTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(title:String, txt: String,imageName: UIImage){
        titleLabel?.text = title
        label?.text = txt
        img.image = imageName
    }
}
