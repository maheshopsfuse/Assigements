//
//  MarathonCollectionViewCell.swift
//  Sample Project
//
//  Created by Admin on 11/10/21.
//

import UIKit

class MarathonCollectionViewCell: UICollectionViewCell {

    static let identifier = "MarathonCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MarathonCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressText: UILabel!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
