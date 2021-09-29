//
//  Picker.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

protocol PickerDelegate {
    func pickerDelegate(text: String)
}

class Picker: UITableViewCell, UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print(pickerData[row])
        pickerDelegate?.pickerDelegate(text: pickerData[row])
    }
    static let identifier = "Picker"
    
    static func nib() -> UINib{
        return UINib(nibName: "Picker", bundle: nil)
    }
    
    var pickerDelegate: PickerDelegate?

    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        picker.delegate = self
        picker.dataSource = self
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    }

    
}
