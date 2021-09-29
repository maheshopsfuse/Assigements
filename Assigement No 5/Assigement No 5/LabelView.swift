//
//  LabelView.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

class LabelView: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "LabelView"
    
    static func nib() -> UINib {
        return UINib(nibName: "LabelView", bundle: nil)
    }
    public func configure(with title: String){
        label?.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
