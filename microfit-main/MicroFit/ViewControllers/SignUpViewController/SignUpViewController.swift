//
//  SignUpViewController.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: FormTextField!
    @IBOutlet weak var textFieldPassword: FormTextField!
    @IBOutlet weak var textFieldFirstName: FormTextField!
    @IBOutlet weak var buttonCreateAccount: UIButton!
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
        self.textFieldFirstName.configureFormTextField()
        self.buttonCreateAccount.configureCommonButtonStyle("Create account".uppercased(), nil)
    }

    //MARK: - Button Actions
    @IBAction func buttonCreatAccountTouchUpInside(_ sender: Any) {
    }
}
