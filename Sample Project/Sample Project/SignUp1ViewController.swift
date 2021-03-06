import UIKit

class SignUp1ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var ageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageTextField.delegate = self
        
        maleButton.buttonDesign(align: .left)
        femaleButton.buttonDesign(align: .left)
        otherButton.buttonDesign(align: .left)
        
        ageTextField.textFieldDesign()
        nextButton.buttonDesign()
        
        self.hideKeyboardAround()
    }
    @IBAction func nextPressed(_ sender: UIButton) {
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "SignUp2") as! SignUp2ViewController
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func gender(sender: UIButton){
        if let buttonTitle = sender.title(for: .normal) {
            //sender.backgroundColor = .white
            print(buttonTitle)
        }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
