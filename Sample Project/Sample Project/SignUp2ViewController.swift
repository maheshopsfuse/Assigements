//
//  SignUp2ViewController.swift
//  Sample Project
//
//  Created by Admin on 06/10/21.
//

import UIKit

class SignUp2ViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.buttonDesign()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "SignUp3") as! SignUp3ViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
