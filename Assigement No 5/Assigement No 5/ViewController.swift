import UIKit

let notificationKey = "com.assigement5"

struct Details {
    var name: String = ""
    var date: String = ""
    var switchValue: Bool = true
    var sliderValue: String = ""
    var pickerValue: String = "Item 1"
    var stepperValue: String = ""
    var segmentedControlValue: String = ""
    var textAreaValue: String = ""
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name:String = ""
    
    var data = Details()
    let key = Notification.Name(rawValue: notificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let labelCell = tableView.dequeueReusableCell(withIdentifier: LabelView.identifier, for: indexPath) as! LabelView
            labelCell.configure(with: "Student Registration")
            return labelCell
        }
        if indexPath.row == 1 {
            let textCell = tableView.dequeueReusableCell(withIdentifier: TextField.identifier, for: indexPath) as! TextField
            textCell.textField.placeholder = "Enter Name"
            textCell.text = self
            return textCell
        }
        if indexPath.row == 2 {
            let textCell = tableView.dequeueReusableCell(withIdentifier: TextField.identifier, for: indexPath) as! TextField
            textCell.textField.keyboardType = UIKeyboardType.numberPad
            textCell.textField.placeholder = "Enter Phone Number"
            textCell.text = self
            return textCell
        }
        if indexPath.row == 3 {
            let dateCell = tableView.dequeueReusableCell(withIdentifier: DatePicker.identifier, for: indexPath) as! DatePicker
            dateCell.datePickerDelegate = self
            return dateCell
        }
        if indexPath.row == 4 {
            let switchCell = tableView.dequeueReusableCell(withIdentifier: Switch.identifier, for: indexPath) as! Switch
            switchCell.switchDelegate = self
            return switchCell
        }
        if indexPath.row == 5 {
            let sliderCell = tableView.dequeueReusableCell(withIdentifier: Slider.identifier, for: indexPath) as! Slider
            sliderCell.sliderDelegate = self
            return sliderCell
        }
        if indexPath.row == 6 {
            let pickerCell = tableView.dequeueReusableCell(withIdentifier: Picker.identifier, for: indexPath) as! Picker
            pickerCell.pickerDelegate = self
            return pickerCell
        }
        if indexPath.row == 7 {
            let acitivityCell = tableView.dequeueReusableCell(withIdentifier: ActivityIndicator.identifier, for: indexPath) as! ActivityIndicator
            return acitivityCell
        }
        if indexPath.row == 8 {
            let stepperCell = tableView.dequeueReusableCell(withIdentifier: Stepper.identifier, for: indexPath) as! Stepper
            stepperCell.stepperDelegate = self
            return stepperCell
        }
        if indexPath.row == 9 {
            let segmentedCell = tableView.dequeueReusableCell(withIdentifier: SegmentedControl.identifier, for: indexPath) as! SegmentedControl
            segmentedCell.segmentedControlDelegate = self
            return segmentedCell
        }
        if indexPath.row == 10 {
            let areaCell = tableView.dequeueReusableCell(withIdentifier: TextArea.identifier, for: indexPath) as! TextArea
            areaCell.textAreaDelegate = self
            return areaCell
        }
        if indexPath.row == 11 {
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: ButtonView.identifier, for: indexPath) as! ButtonView
            return buttonCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LabelView.nib(), forCellReuseIdentifier: LabelView.identifier)
        tableView.register(TextField.nib(), forCellReuseIdentifier: TextField.identifier)
        tableView.register(ButtonView.nib(), forCellReuseIdentifier: ButtonView.identifier)
        tableView.register(DatePicker.nib(), forCellReuseIdentifier: DatePicker.identifier)
        tableView.register(Switch.nib(), forCellReuseIdentifier: Switch.identifier)
        tableView.register(Slider.nib(), forCellReuseIdentifier: Slider.identifier)
        tableView.register(Picker.nib(), forCellReuseIdentifier: Picker.identifier)
        tableView.register(ActivityIndicator.nib(), forCellReuseIdentifier: ActivityIndicator.identifier)
        tableView.register(Stepper.nib(), forCellReuseIdentifier: Stepper.identifier)
        tableView.register(SegmentedControl.nib(), forCellReuseIdentifier: SegmentedControl.identifier)
        tableView.register(TextArea.nib(), forCellReuseIdentifier: TextArea.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        createObserver()
    }
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateData), name: key, object: nil)
    }
    @objc func updateData(){
        print("Name :\(data.name)")
        if(data.switchValue){
            print("In Date :\(data.date)")
        }
        print("Date :\(data.date)")
        print("Age :\(data.sliderValue)")
        print("City :\(data.pickerValue)")
        print("Item Count :\(data.stepperValue)")
        print("Gender :\(data.segmentedControlValue)")
        print("Address :\(data.textAreaValue)")
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "DisplayData") as! DisplayData
        vc.data = data
        present(vc, animated: true, completion: nil)
    }
}

extension ViewController:SetText{
    func setText(text: String) {
        data.name = text
    }
}
extension ViewController:DatePickerDelegate{
    func datePickerDelegate(text: String) {
        data.date = text
    }
}
extension ViewController:SwitchDelegate{
    func switchDelegate(text: Bool) {
        data.switchValue = text
    }
}
extension ViewController:SliderDelegate{
    func sliderDelegate(text: String) {
        data.sliderValue = text
    }
}
extension ViewController:PickerDelegate{
    func pickerDelegate(text: String) {
        data.pickerValue = text
    }
}
extension ViewController:StepperDelegate{
    func stepperDelegate(text: String) {
        data.stepperValue = text
    }
}
extension ViewController: SegmentedControlDelegate{
    func segmentedControlDelegate(text: String) {
        data.segmentedControlValue = text
    }
}
extension ViewController: TextAreaDelegate{
    func textAreaDelegate(text: String) {
        data.textAreaValue = text
    }
}
