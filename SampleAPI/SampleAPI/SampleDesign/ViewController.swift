//
//  ViewController.swift
//  SampleAPI
//
//  Created by Admin on 08/11/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    enum currentSection: Int {
        case profileList
        case loader
    }
    
    private let pageLimit = 20
    private var currentLastId: Int? = nil
    
    private var profiles = [NSManagedObject]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Profile.self))
        //fetchRequest.sortDescriptors = [NSSortDescriptor(key: "login", ascending: true)]
    
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try frc.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        
        return frc
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SampleTableViewCell.nib(), forCellReuseIdentifier: SampleTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        updateTableContent()
    }
    
    func updateTableContent() {
        do {
            try self.fetchedhResultController.performFetch()
            print("COUNT FETCHED FIRST: \(String(describing: self.fetchedhResultController.sections?[0].numberOfObjects))")
        } catch let error  {
            print("ERROR: \(error)")
        }
        
        APIManager.shared.getProfiles(perPage: pageLimit, sinceId: currentLastId) { [weak self] result in
            switch result {
            case .success(let data):
                self!.saveInCoreDataWith(array: data)
            case .failure(let message):
                DispatchQueue.main.async {
                    //self.showAlertWith(title: "Error", message: message)
                    print(message.localizedDescription)
                }
            }
        }
    }
    
    private func createPhotoEntityFrom(dictionary: ProfileStruct) -> NSManagedObject? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let profileEntity = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context) as? Profile {
            
            profileEntity.id = Int32(dictionary.id)
            profileEntity.login = dictionary.login as String
            profileEntity.avatarUrl = dictionary.avatarURL as String
            
            return profileEntity
        }
        return nil
    }
    
    private func saveInCoreDataWith(array: [ProfileStruct]) {
        _ = array.map{profile in self.createPhotoEntityFrom(dictionary: profile)}
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    private func fetchData(completed: ((Bool) -> Void)? = nil) {
        APIManager.shared.getProfiles(perPage: pageLimit, sinceId: currentLastId) { [weak self] result in
            switch result {
            case .success(let profile):
                self?.currentLastId = profile.last?.id
                completed?(true)
            case .failure(let error):
                print(error.localizedDescription)
                completed?(false)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 8
        guard let listSection = currentSection(rawValue: section) else { return 0 }
        switch listSection {
        case .profileList:
            if let count = fetchedhResultController.sections?.first?.numberOfObjects {
                return count
            }
        case .loader:
            return profiles.count >= pageLimit ? 1 : 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = currentSection(rawValue: indexPath.section) else { return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier, for: indexPath) as! SampleTableViewCell
        // 9
        switch section {
        case .profileList:
            if let profile = fetchedhResultController.object(at: indexPath) as? Profile {
                cell.configure(name: profile.login!, profileImageName: profile.avatarUrl!)
            }
        case .loader:
            cell.textLabel?.text = "Loading.."
            cell.textLabel?.textColor = .systemBlue
        }
        return cell
    }
    
    // 10
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let section = currentSection(rawValue: indexPath.section) else { return }
        guard !profiles.isEmpty else { return }
        
        if section == .loader {
            APIManager.shared.getProfiles(perPage: pageLimit, sinceId: currentLastId) { [weak self] result in
                switch result {
                case .success(let data):
                    self!.saveInCoreDataWith(array: data)
                case .failure(let message):
                    self?.hideBottomLoader()
                    print(message.localizedDescription)
                }
            }
        }
    }
    // 11
    private func hideBottomLoader() {
        DispatchQueue.main.async {
            let lastListIndexPath = IndexPath(row: self.profiles.count - 1, section: currentSection.profileList.rawValue)
            self.tableView.scrollToRow(at: lastListIndexPath, at: .bottom, animated: true)
        }
    }
}

/*extension ViewController: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
}

*/
