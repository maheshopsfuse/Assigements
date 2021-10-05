
import UIKit

class SignUp1ViewController: UIViewController {

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var ageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        maleButton.buttonDesign(align: .left)
        femaleButton.buttonDesign(align: .left)
        otherButton.buttonDesign(align: .left)
        
        ageTextField.textFieldDesign()
        nextButton.buttonDesign()
    }
    @IBAction func nextPressed(_ sender: UIButton) {
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
}
