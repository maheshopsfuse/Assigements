//
//  Stepper.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

protocol StepperDelegate {
    func stepperDelegate(text: String)
}

class Stepper: UITableViewCell {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    static let identifier = "Stepper"
    
    static func nib() -> UINib{
        return UINib(nibName: "Stepper", bundle: nil)
    }
    
    var stepperDelegate: StepperDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stepper.autorepeat = true
        stepper.isContinuous = true
        label.text = stepper.value.description
        stepper.maximumValue = 20
        stepper.minimumValue = 0
    }
    @IBAction func onChange(_ sender: UIStepper) {
        label.text = sender.value.description
        stepperDelegate?.stepperDelegate(text: sender.value.description)
    }
}
