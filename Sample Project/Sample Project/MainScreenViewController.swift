import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    /*var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.purple.cgColor]//Colors you want to add
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.2)
        gradientLayer.frame = CGRect.zero
       return gradientLayer
    }() */
    var gradientLayer = CAGradientLayer()
    
    var data:[[String]] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        var noOfSection:Int = 0
        noOfSection = tableViewSection()
        return noOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        numberOfRow = data.count
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  vc  = storyboard?.instantiateViewController(withIdentifier: "Marathon") as! MarathonViewController
        
        /*vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)*/
        
        vc.navigationItem.largeTitleDisplayMode = .never
        //navigationController?.pushViewController(vc, animated: true)
        tabBarController?.present(vc, animated: true, completion: nil)
    }
    

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createGradientLayer()
        tableView.register(ProfileTableViewCell.nib(), forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        data = [["hello"],["hello"],["hello"],["hello"],["hello"]]
        pageControl.currentPage = 0
        pageControl.numberOfPages = 2
        
        collectionView.register(Progress1TableViewCell.nib(), forCellWithReuseIdentifier: Progress1TableViewCell.identifier)
        
        collectionView.register(Progress2TableViewCell.nib(), forCellWithReuseIdentifier: Progress2TableViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let buttonTitle = button.title(for: .normal) {
            button.setTitle(buttonTitle.uppercased(), for: .normal)
        }
        //gradientLayer.frame = self.view.bounds

        //self.view.layer.addSublayer(gradientLayer)
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
                let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.5)

               //view.layer.addSublayer(gradientLayer)
               //print(view.layer.zPosition)
               //print(gradientLayer.zPosition)
        view.layer.insertSublayer(gradientLayer, at: 0)
       
        //configureProgressView()
    }
    override func viewWillLayoutSubviews() {
           gradientLayer.frame = CGRect(x: 20, y: 0, width: 380, height: 572)
       }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
     
        gradientLayer.frame = self.view.bounds
     
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
     
        self.view.layer.addSublayer(gradientLayer)
    }
    func configureProgressView() {
        let img: UIImageView = UIImageView(frame: CGRect(x: 24, y: 285, width: 90, height: 75
        ))
        img.backgroundColor = .white
        img.image = UIImage(named: "man")
        
        //progressView.addSubview(img)
    }
    
    func tableViewSection() -> Int{
        var numOfSections: Int = 0
        if (data.count > 0)
            {
                tableView.separatorStyle = .singleLine
                numOfSections            = 1
                tableView.backgroundView = nil
            }
            else
            {
                let noDataView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                noDataView.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.0)
                
                let noDataImage: UIImageView = UIImageView(frame: CGRect(x: 166, y: 116, width: 44, height:32))
                noDataImage.image = UIImage(named: "man")
                
                noDataView.addSubview(noDataImage)
                
                let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 24, y: 140, width: 343, height: 66))
                noDataLabel.text          = "The secret of getting ahead is getting started."
                noDataLabel.textColor     = UIColor(red: 160, green: 160, blue: 160, alpha: 1)
                noDataLabel.textAlignment = .center
                noDataLabel.font = UIFont.italicSystemFont(ofSize: 27)
                noDataLabel.numberOfLines = 2
               
                noDataView.addSubview(noDataLabel)
                
                let noDataText:  UILabel = UILabel(frame: CGRect(x: 147, y: 254, width: 81, height: 18))
                noDataText.text          = "Mark Twain"
                noDataText.textColor     = UIColor(red: 160, green: 160, blue: 160, alpha: 1)
                noDataText.textAlignment = .center
                noDataText.font = noDataText.font.withSize(15)
                
                noDataView.addSubview(noDataText)
                
                tableView.backgroundView  = noDataView
                tableView.separatorStyle  = .none
                
                button.setTitle("add your first goal".uppercased(), for: .normal)
            }
            return numOfSections
    }
    
    
}
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Progress1TableViewCell.identifier, for: indexPath) as! Progress1TableViewCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Progress2TableViewCell.identifier, for: indexPath) as! Progress2TableViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        print(height,width)
        return CGSize(width: width, height: height)
    }
}
