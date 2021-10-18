import UIKit

class ArcViewController: UIViewController {

    @IBOutlet weak var arcView: ArcView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
