//
//  MarathonTableViewCell.swift
//  Sample Project
//
//  Created by Admin on 11/10/21.
//

import UIKit

class MarathonTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var txt: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    public func configure(text:String, imageName:UIImage){
        txt?.text = text
        img.image = imageName
        title.isHidden = true
        txt.isHidden = false
        img.isHidden = false

    }
    public func configure(text:String){
        txt.isHidden = true
        img.isHidden = true
        title.isHidden = false
        title?.text = text
    }
    
    static let identifier = "MarathonTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MarathonTableViewCell", bundle: nil)
    }
}
