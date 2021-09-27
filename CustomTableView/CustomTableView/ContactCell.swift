//
//  ContactCell.swift
//  CustomTableView
//
//  Created by Admin on 27/09/21.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var icon : UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    func updateCellView(contact: ContactModel) {
        icon.image = UIImage(named: contact.icon)
        firstName.text = contact.firstName
        lastName.text = contact.lastName
        phoneNumber.text = contact.phoneNumber
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
