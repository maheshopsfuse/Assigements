//
//  WelcomeViewController.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonApple: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    fileprivate func setupUI(){
        buttonLogin.configureCommonButtonStyle("login".uppercased(), nil)
        buttonApple.configureCommonButtonStyle(nil, UIImage(named: "AppleLogo"))
        buttonSignUp.configureCommonButtonStyle("sign up with email".uppercased(), nil)
    }
    
    @IBAction func buttonLoginTouchUpInside(_ sender: Any) {
        let controller = self.controllerLogin()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func buttonAppleLoginTouchUpInside(_ sender: Any) {
    }
    
    @IBAction func buttonSignUpEmailTouchUpInside(_ sender: Any) {
        let controller = self.controllerSignUp()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
