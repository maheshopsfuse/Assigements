//
//  PhotoView.swift
//  Assigement No 6
//
//  Created by Admin on 30/09/21.
//

import UIKit

class PhotoView: UICollectionViewCell {
    static let identifier = "PhotoView"
    
     var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
       /* let img = [
            UIImage(named: "cat")
        ].compactMap({$0})*/
        
       // imageView.image = img.randomElement()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
