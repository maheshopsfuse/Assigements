//
//  StudentDetailsController.swift
//  TableView
//
//  Created by Admin on 27/09/21.
//

import UIKit

class StudentDetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var studentTableView: UITableView!
    let studentsDetails: [String] = ["Mahesh Nagmal", "Deepak Awar", "Ravi Soma", "Ravi Kota", "Umesh Udata"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.studentImage.image = UIImage(named: "cat")
        cell.studentImage.layer.cornerRadius = cell.studentImage.frame.height / 2
        cell.label.text = studentsDetails[indexPath.row]
        
        return cell
        
    }
    

    override func viewDidLoad() {
        studentTableView.delegate = self
        studentTableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
