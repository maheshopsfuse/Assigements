//
//  ViewController.swift
//  PageViewListExample
//
//  Created by Admin on 25/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerBottomTabBar: UIView!
    @IBOutlet weak var buttonHome: UIButton!
    @IBOutlet weak var buttonMessage: UIButton!
    @IBOutlet weak var buttonUserProfile: UIButton!
    
    var viewControllers = [UIViewController]()
    private var pageViewController: UIPageViewController!
    
    enum Tabbaritems: Int{
        case home  = 0
        case message
        case userprofile
    }
    
    var selectedTab: Tabbaritems = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstViewController = FirstViewController(nibName: FirstViewController.identifier, bundle: nil)
        viewControllers.append(firstViewController)
        
        let secondViewController = FirstViewController(nibName: SecondViewController.identifier, bundle: nil)
        secondViewController.view.backgroundColor = .red
        viewControllers.append(secondViewController)
        
        let thridViewController = FirstViewController(nibName: FirstViewController.identifier, bundle: nil)
        thridViewController.view.backgroundColor = .black
        viewControllers.append(thridViewController)
        
        if let vc = segue.destination as? UIPageViewController {
            pageViewController = vc
            pageViewController.delegate = self
            pageViewController.setViewControllers([self.viewControllers[0]], direction: .forward, animated: false, completion: nil)
        }
    }
    fileprivate func setupUI(){
        
       // containerBottomTabBar.applyShadow(color: AppColors.colorF2F2F2.colorValue, opacity: 1.0, offset: CGSize(width: 0, height: 0))
    }
    
    fileprivate func configureTabColors(){
        buttonHome.tintColor =  AppColors.color74777B.colorValue
        buttonMessage.tintColor = AppColors.color74777B.colorValue
        buttonUserProfile.tintColor = AppColors.color74777B.colorValue
        switch selectedTab{
        
        case .home:
            buttonHome.tintColor =  AppColors.color0072EE.colorValue
        case .message:
            buttonMessage.tintColor = AppColors.color0072EE.colorValue
        case .userprofile:
            buttonUserProfile.tintColor = AppColors.color0072EE.colorValue
        }
    }
    @IBAction func buttonHomeTouchUpInside(_ sender: Any) {
        selectedTab = .home
        containerBottomTabBar.backgroundColor = .white
        pageViewController.setViewControllers([self.viewControllers[0]], direction: .reverse, animated: false, completion: nil)
        configureTabColors()
    }
    
    @IBAction func buttonMessageTouchUpInside(_ sender: Any) {
        selectedTab = .message
        //self.appDelegate.getMatchedUser()
        containerBottomTabBar.backgroundColor = .white
        //self.containerNewMessageBadge.isHidden = true
        pageViewController.setViewControllers([self.viewControllers[1]], direction: .forward, animated: false, completion: nil)
        configureTabColors()
    }
    
    @IBAction func buttonUserProfileTouchUpInside(_ sender: Any) {
        selectedTab = .userprofile
        containerBottomTabBar.backgroundColor = .white
        pageViewController.setViewControllers([self.viewControllers[2]], direction: .forward, animated: false, completion: nil)
        configureTabColors()
    }
   /* func presentPageVC() {
        guard let first = myControllers.first  else{
            return
        }
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        vc.delegate = self
        
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        //show(vc, sender: nil)
        
        present(vc, animated: true)
        
    }
*/
}

extension ViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        if (pageViewController.viewControllers?.first) != nil{
            
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.viewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
extension ViewController: FirstViewControllerDelegate{
    func buttonStartMatchingTouchUpInside() {
        selectedTab = .home
        containerBottomTabBar.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        pageViewController.setViewControllers([self.viewControllers[0]], direction: .reverse, animated: false, completion: nil)
        configureTabColors()
    }
    
    func buttonCompleteProfileTouchUpInside() {
        selectedTab = .userprofile
        containerBottomTabBar.backgroundColor = .white
        pageViewController.setViewControllers([self.viewControllers[2]], direction: .forward, animated: false, completion: nil)
        configureTabColors()
    }
}
