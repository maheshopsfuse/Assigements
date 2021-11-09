//
//  SampleTableViewCell.swift
//  SampleAPI
//
//  Created by Admin on 08/11/21.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    static let identifier = "SampleTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SampleTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(name: String, profileImageName: String){
        
        profileImageView.load(urlString: profileImageName)
        
        nameLabel.text = name
    }
}

struct ProfileStruct: Codable {
    let login: String
    let id: Int
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
       
    }
}
