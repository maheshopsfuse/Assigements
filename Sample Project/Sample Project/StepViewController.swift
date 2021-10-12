import UIKit

class StepViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /* let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer) */
        // Do any additional setup after loading the view.
    }
   /* @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
    } */
    @IBAction func buttonPressed(_ sender: UIButton) {
        /*let youtubeId = "SxTYjptEzZs"
        var youtubeUrl = URL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(youtubeUrl){
            //UIApplication.shared.openURL(youtubeUrl as URL)
            //UIApplication.shared.canOpenURL(youtubeUrl)
            UIApplication.shared.open(youtubeUrl, options: [:], completionHandler: nil)
        } else{
            youtubeUrl = URL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            //UIApplication.shared.openURL(youtubeUrl as URL)
            UIApplication.shared.canOpenURL(youtubeUrl)
            
        }*/
        UIApplication.shared.open(URL(string: "https://www.youtube.com")! as URL, options: [:], completionHandler: nil)
    }
}
