//
//  DisplayCell.swift
//  Assigement No 5
//
//  Created by Admin on 29/09/21.
//

import UIKit

class DisplayCell: UITableViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var label: UILabel!
    static let identifier = "DisplayCell"
    static func nib() -> UINib {
        return UINib(nibName: "DisplayCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(text: String, textValue: String){
        value?.text = textValue
        label?.text = text
    }
}
