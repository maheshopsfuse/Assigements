//
//  DatePicker.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

protocol DatePickerDelegate {
    func datePickerDelegate(text: String)
}

class DatePicker: UITableViewCell {
    
    @IBOutlet weak var date: UIDatePicker!
    static let identifier = "DatePicker"
    
    var datePickerDelegate: DatePickerDelegate?
    
    static func nib() -> UINib{
        return UINib(nibName: "DatePicker", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yy"
        datePickerDelegate?.datePickerDelegate(text: formatter.string(from: sender.date))
    }
    
}
