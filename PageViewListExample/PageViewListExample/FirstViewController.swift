//
//  FirstViewController.swift
//  PageViewListExample
//
//  Created by Admin on 25/10/21.
//

import UIKit

protocol FirstViewControllerDelegate{
    func buttonStartMatchingTouchUpInside()
    func buttonCompleteProfileTouchUpInside()
}
class FirstViewController: UIViewController {

    var delegate: FirstViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    fileprivate func setupUI(){
        view.layoutIfNeeded()
    }
    @IBAction func buttonStartMatchingTouchUpInside(_ sender: Any) {
        self.delegate?.buttonStartMatchingTouchUpInside()
    }
    
    @IBAction func buttonCompleteProfileViewController(_ sender: Any){
        self.delegate?.buttonCompleteProfileTouchUpInside()
    }
}
