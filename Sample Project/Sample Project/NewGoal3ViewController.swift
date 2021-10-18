import UIKit

class NewGoal3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
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
      
        let headerView = UIView()
       
        headerView.backgroundColor = view.backgroundColor
       
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    @IBOutlet weak var label: UILabel!
    var data = ["6.21 miles","Half marathon","Marathon"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GoalTableViewCell.nib(), forCellReuseIdentifier: GoalTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        label.text = label.text?.uppercased()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
