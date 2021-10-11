//
//  SignUpPageViewController.swift
//  Sample Project
//
//  Created by Admin on 04/10/21.
//

import UIKit

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stmtLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DesignTemplate.buttonDesign(button: <#T##UIButton#>)
        emailTextField.textFieldDesign()
        passwordTextField.textFieldDesign()
        firstNameTextField.textFieldDesign()
        createAccountButton.buttonDesign()
    }
    @IBAction func createAccountPressed(_ sender: UIButton) {
        print("hello")
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "SignUp1") as! SignUp1ViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
