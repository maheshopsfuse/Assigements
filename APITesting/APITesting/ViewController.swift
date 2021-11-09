//
//  ViewController.swift
//  APITesting
//
//  Created by Admin on 03/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    enum TableSection: Int {
        case userList
        case loader
    }
    
    // 2
    private let pageLimit = 25
    private var currentLastId: Int? = nil
    
    private var users = [SampleData]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    let baseURL = "https://jsonplaceholder.typicode.com/posts/?"
    
    let itemsPerBatch = 15
    
    var currentRow : Int = 1
    
    var url : URL {
      return URL(string: "\(baseURL)start=\(currentRow)&limit=\(itemsPerBatch)")!
    }

    var data = [SampleData]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* getData(from: "https://jsonplaceholder.typicode.com/posts",completed: {
            self.tableView.reloadData()
        })
        postData(from: "https://jsonplaceholder.typicode.com/posts") */
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData()
        
    }
    private func fetchData(completed: ((Bool) -> Void)? = nil) {
        APIManager.shared.getUsers(perPage: pageLimit, sinceId: currentLastId) { [weak self] result in
            switch result {
            case .success(let users):
                self?.users.append(contentsOf: users)
                // 5
                // assign last id for next fetch
                self?.currentLastId = users.last?.id
                completed?(true)
            case .failure(let error):
                print(error.localizedDescription)
                // 6
                completed?(false)
            }
        }
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
        
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
        "userId": 1,
        "title": "who is to be",
        "body": "it is the time of life to pursue the things that are to be blamed for the pain of a happy one, nor avoid the pleasures of flattery.",]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let resp = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(resp)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 8
        guard let listSection = TableSection(rawValue: section) else { return 0 }
        switch listSection {
        case .userList:
            return users.count
        case .loader:
            return users.count >= pageLimit ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = TableSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        // 9
        switch section {
        case .userList:
            let repo = users[indexPath.row]
            cell.textLabel?.text = "\(repo.id)"
            cell.textLabel?.textColor = .label
            cell.detailTextLabel?.text = "\(indexPath.row + 1)"
        case .loader:
            cell.textLabel?.text = "Loading.."
            cell.textLabel?.textColor = .systemBlue
        }
        return cell
    }
    
    // 10
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let section = TableSection(rawValue: indexPath.section) else { return }
        guard !users.isEmpty else { return }
        
        if section == .loader {
            print("load new data..")
            fetchData { [weak self] success in
                if !success {
                    self?.hideBottomLoader()
                }
            }
        }
    }
    // 11
    private func hideBottomLoader() {
        DispatchQueue.main.async {
            let lastListIndexPath = IndexPath(row: self.users.count - 1, section: TableSection.userList.rawValue)
            self.tableView.scrollToRow(at: lastListIndexPath, at: .bottom, animated: true)
        }
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
