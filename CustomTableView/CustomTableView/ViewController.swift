//
//  ViewController.swift
//  CustomTableView
//
//  Created by Admin on 27/09/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contacts = [
        ContactModel(icon:"usericon.png", firstName: "Mahesh", lastName: "Nagmal",phoneNumber: "9881938639"),
        ContactModel(icon:"usericon.png", firstName: "Deepak", lastName: "Awar",phoneNumber: "9881938639")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell",for: indexPath) as? ContactCell{
            let  extractedContact = contacts[indexPath.row]
            
            cell.updateCellView(contact: extractedContact)
            return cell
        }else{
            return ContactCell()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


}

