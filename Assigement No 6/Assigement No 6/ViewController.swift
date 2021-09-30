import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var password: UITextField!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBOutlet weak var emailID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailID.delegate = self
        password.delegate = self
        self.hideKeyboardAround()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "CollectionScreen") as! CollectionScreen
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension UIViewController{
    func hideKeyboardAround()   {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
