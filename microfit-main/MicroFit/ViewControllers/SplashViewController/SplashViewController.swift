//
//  SplashViewController.swift
//  MicroFit
//
//  Created by Harjeet Singh on 28/09/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller = self.controllerWelcome()
        self.makeRootViewController(controller)
    }

}
