import UIKit

class ProfileScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [["10 days streak","40% of users have this"], ["10 days streak","40% of users have this"], ["10 days streak","40% of users have this"]]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        if segmentedBar.selectedSegmentIndex == 0{
            cell.configure(title: data[indexPath.row][0], txt: data[indexPath.row][1],imageName: UIImage(named: "star")!)
        }else{
            cell.configure(title: data[indexPath.row][0], txt: data[indexPath.row][1],imageName: UIImage(named: "Polygon")!)
        }
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 1
        let headerView = UIView()
        // 2
        headerView.backgroundColor = view.backgroundColor
        // 3
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedBar: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileTableViewCell.nib(), forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        segmentedBar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: .normal)
        
        
    }
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
