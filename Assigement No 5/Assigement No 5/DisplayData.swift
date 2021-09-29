import UIKit

class DisplayData: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "Name :", textValue: data.name)
            return labelCell
        }
        if indexPath.row == 1{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "Date :", textValue: data.date)
            return labelCell
        }
        if indexPath.row == 2{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "Age :", textValue: data.sliderValue)
            return labelCell
        }
        if indexPath.row == 3{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "City :", textValue: data.pickerValue)
            return labelCell
        }
        if indexPath.row == 4{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "Item Count :", textValue: data.stepperValue)
            return labelCell
        }
        if indexPath.row == 5{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "Gender :", textValue: data.segmentedControlValue)
            return labelCell
        }
        if indexPath.row == 6{
            let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
            labelCell.configure(text: "Comments :", textValue: data.textAreaValue)
            return labelCell
        }
        let labelCell = tableView.dequeueReusableCell(withIdentifier: DisplayCell.identifier, for: indexPath) as! DisplayCell
        labelCell.configure(text: "Label", textValue: "Value")
        return labelCell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var data = Details()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DisplayCell.nib(), forCellReuseIdentifier: DisplayCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}
