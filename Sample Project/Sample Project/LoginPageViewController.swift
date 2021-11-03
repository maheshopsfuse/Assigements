import UIKit

class LoginPageViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stmtLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.buttonDesign()
        
        emailTextField.textFieldDesign()
        
        passwordTextField.textFieldDesign()
        
        headingLabel.addCharacterSpacing()
        
        passwordLabel.text = passwordLabel.text?.uppercased()
        passwordLabel.addCharacterSpacing()
        
        emailLabel.text = emailLabel.text?.uppercased()
        emailLabel.addCharacterSpacing()
        
        self.hideKeyboardAround()
        
    }
    @IBAction func loginPressed(_ sender: UIButton) {
    }
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
