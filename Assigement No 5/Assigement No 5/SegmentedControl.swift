import UIKit

protocol SegmentedControlDelegate {
    func  segmentedControlDelegate(text: String)
}
class SegmentedControl: UITableViewCell {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    static let identifier = "SegmentedControl"
    
    static func nib() -> UINib{
        return UINib(nibName: "SegmentedControl", bundle: nil)
    }
    
    var segmentedControlDelegate: SegmentedControlDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func onChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        print(sender.titleForSegment(at: index)!)
        segmentedControlDelegate?.segmentedControlDelegate(text: sender.titleForSegment(at: index)!)
    }
}
