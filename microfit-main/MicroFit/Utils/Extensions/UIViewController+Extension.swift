//
//  UIViewController+Extension.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import Foundation
import UIKit

extension UIViewController{
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var window: UIWindow? {
        if #available(iOS 13, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
            return window
        }
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate, let window = delegate.window else { return nil }
        return window
    }
    
    func makeRootViewController(_ controller: UIViewController){
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

extension UIViewController{
    
    func controllerWelcome() -> UIViewController{
        return WelcomeViewController(nibName: WelcomeViewController.storyboardIdentifier, bundle: nil)
    }
    
    func controllerLogin() -> UIViewController{
        return LoginViewController(nibName: LoginViewController.storyboardIdentifier, bundle: nil)
    }
    
    func controllerSignUp() -> UIViewController{
        return SignUpViewController(nibName: SignUpViewController.storyboardIdentifier, bundle: nil)
    }
}
