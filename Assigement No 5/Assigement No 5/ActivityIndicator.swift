//
//  ActivityIndicator.swift
//  Assigement No 5
//
//  Created by Admin on 28/09/21.
//

import UIKit

class ActivityIndicator: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    static let identifier = "ActivityIndicator"
    
    static func nib() -> UINib{
        return UINib(nibName: "ActivityIndicator", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func start(_ sender: UIButton) {
        activityIndicator.startAnimating()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        activityIndicator.stopAnimating()
    }
}
