import UIKit

class GoalScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = [["0,0", "0,1", "0,2"], ["1,0", "1,1", "1,2"]]
    let headerTitles = ["Ongoing", "Previous"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        if indexPath.section == 1{
            
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section].uppercased()
        }
        return nil
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileTableViewCell.nib(), forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
