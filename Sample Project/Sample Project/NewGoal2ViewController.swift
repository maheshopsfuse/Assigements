
import UIKit

class NewGoal2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = ["Beginner","Intermediate","Expert","Advanced"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoalTableViewCell.identifier, for: indexPath) as! GoalTableViewCell
        cell.configure(title: data[indexPath.row])
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
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GoalTableViewCell.nib(), forCellReuseIdentifier: GoalTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 10
        label.text = label.text?.uppercased()
        
    }
    
}
