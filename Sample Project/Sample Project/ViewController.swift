
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stmtLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //DesignTemplate.buttonDesign(button: loginButton)
        //DesignTemplate.buttonDesign(button: signUpButton)
        //DesignTemplate.buttonDesign(button: iconButton)
        loginButton.buttonDesign()
        signUpButton.buttonDesign()
        iconButton.buttonDesign(height: 46)
        headingLabel.addCharacterSpacing(kernValue: 3.0)
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginPageViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignUpPageViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)

    }
    
}
