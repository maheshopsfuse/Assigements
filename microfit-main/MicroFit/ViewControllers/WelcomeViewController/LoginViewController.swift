//
//  LoginViewController.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: FormTextField!
    @IBOutlet weak var textFieldPassword: FormTextField!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    fileprivate func setupUI(){
        self.textFieldEmail.configureFormTextField()
        self.textFieldPassword.configureFormTextField()
        self.buttonLogin.configureCommonButtonStyle("login".uppercased(), nil)
    }

    //MARK: - Button Actions
    @IBAction func buttonLoginTouchUpInside(_ sender: Any) {
    }
    
}
