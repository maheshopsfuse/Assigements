//
//  ItemContent.swift
//  PageViewExample
//
//  Created by Admin on 25/10/21.
//

import UIKit

class ItemContent: UIView {
    
    static let ITEM_CONTENT_NIB = "ItemContent"
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet var viewContent: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initWithNib()
    }
    
    convenience init(titleText: String? = "", background: UIColor? = .red) {
        self.init()
        labelTitle.text = titleText
        viewBackground.backgroundColor = background
    }
    
    fileprivate func initWithNib() {
        Bundle.main.loadNibNamed(ItemContent.ITEM_CONTENT_NIB, owner: self, options: nil)
        viewContent.frame = bounds
        viewContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(viewContent)
    }
}
