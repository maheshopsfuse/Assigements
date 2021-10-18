import UIKit

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stmtLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        emailTextField.textFieldDesign()
        
        passwordTextField.textFieldDesign()
        
        firstNameTextField.textFieldDesign()
        
        createAccountButton.buttonDesign()
        
        headingLabel.addCharacterSpacing()
        
        nameLabel.text = nameLabel.text?.uppercased()
        nameLabel.addCharacterSpacing()
        
        passwordLabel.text = passwordLabel.text?.uppercased()
        passwordLabel.addCharacterSpacing()
        
        emailLabel.text = emailLabel.text?.uppercased()
        emailLabel.addCharacterSpacing()
        
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
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
