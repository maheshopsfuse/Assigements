

import UIKit

class SignUp4ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var data = [["iI want to run a marathon","person"],["I want to do more pushups","man"],["I want to do more pullups","man"]]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccomplishTableViewCell.identifier, for: indexPath) as! AccomplishTableViewCell
        cell.configure(title: data[indexPath.row][0], imgName: UIImage(named: data[indexPath.row][1])!)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AccomplishTableViewCell.nib(), forCellReuseIdentifier: AccomplishTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func backPressed(_ sender: UIButton) {navigationController?.popViewController(animated: true)
    }
}
