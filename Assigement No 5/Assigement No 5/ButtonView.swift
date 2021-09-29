//
//  ButtonView.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

class ButtonView: UITableViewCell {

    static let identifier = "ButtonView"
    
    static func nib() -> UINib{
        return UINib(nibName: "ButtonView", bundle: nil)
    }
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let name = Notification.Name(rawValue: notificationKey)
        NotificationCenter.default.post(name: name, object: nil)
    }
    
}
