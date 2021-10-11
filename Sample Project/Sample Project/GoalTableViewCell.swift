//
//  GoalTableViewCell.swift
//  Sample Project
//
//  Created by Admin on 06/10/21.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
    
    static let identifier = "GoalTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "GoalTableViewCell", bundle: nil)
    }

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func configure(title: String){
        label?.text = title
    }

}
