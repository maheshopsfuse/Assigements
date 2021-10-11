//
//  MarathonViewController.swift
//  Sample Project
//
//  Created by Admin on 11/10/21.
//

import UIKit

class MarathonViewController: UIViewController {
    
    let data = ["step 1","step 2","step 3"]
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MarathonTableViewCell.nib(), forCellReuseIdentifier: MarathonTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.register(MarathonCollectionViewCell.nib(), forCellWithReuseIdentifier: MarathonCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
}
extension MarathonViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarathonTableViewCell.identifier, for: indexPath) as! MarathonTableViewCell
        
        if(segmentedControl.selectedSegmentIndex == 0){
            cell.configure(text: data[indexPath.row].capitalized, imageName: UIImage(named: "box")!)
        }else{
            cell.configure(text: data[indexPath.row].capitalized)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension MarathonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarathonCollectionViewCell.identifier, for: indexPath) as! MarathonCollectionViewCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarathonCollectionViewCell.identifier, for: indexPath) as! MarathonCollectionViewCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
}
