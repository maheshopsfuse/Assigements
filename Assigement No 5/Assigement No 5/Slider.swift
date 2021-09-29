//
//  Slider.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

protocol SliderDelegate {
    func sliderDelegate(text: String)
}

class Slider: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    static let identifier = "Slider"
    var sliderDelegate: SliderDelegate?
    static func nib() -> UINib{
        return UINib(nibName: "Slider", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = 25
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        label.text = "\(Int(sender.value))"
        sliderDelegate?.sliderDelegate(text: "\(Int(sender.value))")
    }
}
