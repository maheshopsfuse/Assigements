import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Data model: These strings will be the data for the table view cells
       let studentsData: [String] = ["Mahesh Nagmal", "Deepak Awar", "Ravi Soma", "Ravi Kota", "Umesh Udata"]
       
       // cell reuse id (cells that scroll out of view can be reused)
       let cellReuseIdentifier = "cell"
              
        @IBOutlet weak var tableView: UITableView!
    
        override func viewDidLoad() {
           super.viewDidLoad()
           
           // Register the table view cell class and its reuse id
            
            self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            
           /*self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)*/

           // This view controller itself will provide the delegate methods and row data for the table view.
           tableView.delegate = self
           tableView.dataSource = self
       }
       
       // number of rows in table view
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.studentsData.count
       }
       
       // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell{
                cell.label?.text = studentsData[indexPath.row]
                return cell
            }
            //cell.textLabel?.text = self.studentsData[indexPath.row]
            return UITableViewCell()
        }
       
       // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //print("You tapped cell \(animals[indexPath.row]).")
            
            let defaults = UserDefaults.standard
            defaults.set(studentsData[indexPath.row], forKey: "key")
            
            let vc = storyboard?.instantiateViewController(identifier: "second") as! SecondScreen
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        }
}


