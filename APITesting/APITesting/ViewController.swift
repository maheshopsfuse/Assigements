//
//  ViewController.swift
//  APITesting
//
//  Created by Admin on 03/11/21.
//

import UIKit

class ViewController: UIViewController {

    var data = [SampleData]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(from: "https://jsonplaceholder.typicode.com/posts",completed: {
            self.tableView.reloadData()
        })
        //postData(from: "https://jsonplaceholder.typicode.com/posts")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func getData(from url:String,completed: @escaping ()-> ()){
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            //var result: [Response]?
            
            do{
                //print(String(data: data, encoding: .utf8)!)
                 //let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                //print(result)
                
                self.data = try JSONDecoder().decode([SampleData].self, from: data)
                
                DispatchQueue.main.async {
                    completed()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            
        })
        task.resume()
    }
    private func postData(from text:String){
        guard let url = URL(string: text) else {
            return
        }
       
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        /*let savedData: [String: AnyHashable] = [ "name": "ACME Corporation",
                          "homePage": "https://www.acme-corp.com",
                          "phone": "408-867-5309"]
        let dateData: [String: AnyHashable] = ["type":"Mahesh"]
        let body: [String: AnyHashable] = [
            "id": "d290f1ee-6c54-4b01-90e6-d701748f0851",
            "name": "Widget Adapter",
            "releaseDate": dateData,
            "manufacturer":savedData
        ]*/
        let body: [String: AnyHashable] = [
        "userId": 202,
        "title": "at nam consequatur ea labore ea harum",
        "body": "cupiditate quo est a modi nesciunt soluta\nipsa voluptas error itaque dicta in\nautem qui minus magnam et distinctio eum\naccusamus ratione error aut",]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(response)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = data[indexPath.row].title
        
        return cell
    }
    
    
}
struct Response: Codable {
    let id, name, releaseDate: String
    let manufacturer: Manufacturer
}

// MARK: - Manufacturer
struct Manufacturer: Codable {
    var name: String
    var homePage: String
    var phone: String
}


struct Welcome: Codable {
    var id, name: String
    var releaseDate: ReleaseDate
    var manufacturer: Manufacturer
}


// MARK: - ReleaseDate
struct ReleaseDate: Codable {
}

struct SampleData: Codable {
    var body: String
    var id: Int
    var title: String
    var userId: Int
}
