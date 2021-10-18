import UIKit

class StepViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com")! as URL, options: [:], completionHandler: nil)
    }
}
