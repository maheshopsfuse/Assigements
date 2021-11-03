//
//  TextViewController.swift
//  PageViewListExample
//
//  Created by Admin on 25/10/21.
//

import UIKit

class TextViewController: UIViewController {

    let myText: String
    private let myTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 24)
        return textView
    }()
    
    init(with text:String) {
        self.myText = text
        myTextView.text = self.myText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.myTextView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextView.frame = view.bounds
    }
}
