//
//  Switch.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

protocol SwitchDelegate {
    func switchDelegate(text: Bool)
}

class Switch: UITableViewCell {

    @IBOutlet weak var `switch`: UISwitch!
    static let identifier = "Switch"
    
    var switchDelegate: SwitchDelegate?
    
    static func nib() -> UINib{
        return UINib(nibName: "Switch", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn{
            print("Yes")
            switchDelegate?.switchDelegate(text: true)
        }
        else{
            print("No")
            switchDelegate?.switchDelegate(text: false)
        }
    }
}
