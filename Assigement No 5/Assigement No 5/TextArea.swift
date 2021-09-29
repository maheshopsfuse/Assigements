import UIKit

protocol TextAreaDelegate {
    func textAreaDelegate(text: String)
}

class TextArea: UITableViewCell,UITextViewDelegate {

    @IBOutlet weak var textArea: UITextView!
    static let identifier = "TextArea"
    
    static func nib() -> UINib{
        return UINib(nibName: "TextArea", bundle: nil)
    }
    var textAreaDelegate: TextAreaDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textArea.delegate = self
        textArea.text = ""
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textAreaDelegate?.textAreaDelegate(text: textView.text)
    }
    
}
