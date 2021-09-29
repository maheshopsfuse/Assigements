import UIKit

protocol SetText {
    func setText(text: String)
}

class TextField: UITableViewCell ,UITextFieldDelegate{
    
    static let identifier = "TextField"
    @IBOutlet weak var textField: UITextField!
    static func nib() -> UINib{
        return UINib(nibName: "TextField", bundle: nil)
    }
    var text: SetText?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text! != ""{
            text?.setText(text: (textField.text!))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        textField.becomeFirstResponder()
    }
}
