import UIKit

class ChallengeViewController: UIViewController {

    let data = ["step 1","step 2"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MarathonTableViewCell.nib(), forCellReuseIdentifier: MarathonTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
extension ChallengeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarathonTableViewCell.identifier, for: indexPath) as! MarathonTableViewCell
        
        cell.configure(text: data[indexPath.row].capitalized, imageName: UIImage(named: "box")!)
        
       
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        headerView.backgroundColor = self.view.backgroundColor
        
        return headerView
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 10
    }
}
