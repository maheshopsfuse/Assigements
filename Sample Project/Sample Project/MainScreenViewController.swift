import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var gradientLayer = CAGradientLayer()
    var shapeLayer = CAShapeLayer()

    
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
        
     
        
        vc.navigationItem.largeTitleDisplayMode = .never
       
        tabBarController?.present(vc, animated: true, completion: nil)
    }
    

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        subView()
        
        bottomSubView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
     
        gradientLayer.frame = self.view.bounds
     
        let colorTop = UIColor(red: 255.0 / 255.0, green: 122 / 255.0, blue: 31 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0 / 255.0, green: 20.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0).cgColor
        
        gradientLayer.colors = [colorTop, colorBottom]
     
        self.view.layer.addSublayer(gradientLayer)
    }
    func subView(){
        let myView = UIView(frame: .init(x: 100, y: 0, width: 400, height: 400))

        view.insertSubview(myView, at: 0)

        let startPoint = CGPoint(x: myView.bounds.minX, y: myView.bounds.midY)
        let finishPoint = CGPoint(x: myView.bounds.maxX, y: myView.bounds.midY)

        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: finishPoint)
        
       
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: CGFloat(246), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circlePath.cgPath
        
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let colorTop = UIColor(red: 255.0 / 255.0, green: 122 / 255.0, blue: 31 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 1 / 255.0, green: 1 / 255.0, blue: 1 / 255.0, alpha: 1.0).cgColor

        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = myView.bounds
        gradientLayer.mask = shapeLayer
            
        myView.layer.insertSublayer(gradientLayer, at: 0)
        
        
        myView.layer.cornerRadius = 10
        myView.clipsToBounds = true
        
        myView.transform = CGAffineTransform(rotationAngle: 2.0)
    }
    func bottomSubView()  {
        let myView = UIView(frame: .init(x: -55.6, y: 300, width: 381, height: 572))

        view.insertSubview(myView, at: 0)

        let startPoint = CGPoint(x: myView.bounds.minX, y: myView.bounds.midY)
        let finishPoint = CGPoint(x: myView.bounds.maxX, y: myView.bounds.midY)

        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: finishPoint)
        
       
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: -55.6, y: 300), radius: CGFloat(244), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        let colorTop = UIColor(red: 255.0 / 255.0, green: 8 / 255.0, blue: 88 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 28 / 255.0, green: 28 / 255.0, blue: 30 / 255.0, alpha: 1.0).cgColor

        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = myView.bounds
        gradientLayer.mask = shapeLayer
            
        myView.layer.insertSublayer(gradientLayer, at: 0)
        
        myView.layer.cornerRadius = 10
        myView.clipsToBounds = true
        
        myView.transform = CGAffineTransform(rotationAngle: 0.2)
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
