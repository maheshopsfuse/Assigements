//
//  BaseViewController.swift
//  APITesting
//
//  Created by Admin on 05/11/21.
//

import UIKit

class BatchViewController: UIViewController, UITableViewDataSource{

  @IBOutlet weak var coinTableView: UITableView!
  
  var coinArray : [SampleData] = []
  
  let baseURL = "https://api.coinmarketcap.com/v2/ticker/?"
  
  // fetch 15 items for each batch
  let itemsPerBatch = 15
  
  // current row from database
  var currentRow : Int = 1
  
  // URL computed by current row
  var url : URL {
    return URL(string: "\(baseURL)start=\(currentRow)&limit=\(itemsPerBatch)")!
  }
  
  // ... skipped viewDidLoad stuff
    
  // MARK : - Tableview data source
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // +1 to show the loading cell at the last row
    return self.coinArray.count + 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // if reached last row, load next batch
    if indexPath.row == self.coinArray.count {
        let cell = UITableViewCell()
      loadNextBatch()
      return cell
    }

    // else show the cell as usual
    let cell = UITableViewCell()
    
    // get the corresponding post object to show from the array
    let coin = coinArray[indexPath.row]
    //cell.configureCell(with: coin)
    cell.textLabel?.text = coin.title
    
    return cell
  }
  
  // MARK : - Batch
  func loadNextBatch() {
    URLSession(configuration: URLSessionConfiguration.default).dataTask(with: url) { data, response, error in
      
      // Parse JSON into array of Car struct using JSONDecoder
      guard let coinList = try? JSONDecoder().decode(SampleData.self, from: data!) else {
        print("Error: Couldn't decode data into coin list")
        return
      }
      
      // contain array of tuples, ie. [(key : ID, value : Coin)]
        //let coinTupleArray = coinList.sorted {$0.value.rank < $1.value.rank}
     // for coinTuple in coinList {
       // self.coinArray.append(coinTuple.value)
      //}
        
        
        self.coinArray.append(coinList)
        
      // increment current row
      self.currentRow += self.itemsPerBatch
      
      // Make sure to update UI in main thread
      DispatchQueue.main.async {
        self.coinTableView.reloadData()
      }
      
    }.resume()
  }

}
