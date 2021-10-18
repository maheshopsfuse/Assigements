import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var runImageView: UIImageView!
    @IBOutlet weak var goalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        goalLabel.text = goalLabel.text?.uppercased()
        //runImageView.clipsToBounds = true
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
