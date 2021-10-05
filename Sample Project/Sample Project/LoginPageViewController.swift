import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stmtLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.buttonDesign()
        emailTextField.textFieldDesign()
        passwordTextField.textFieldDesign()
    }
    @IBAction func loginPressed(_ sender: UIButton) {
    }
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
