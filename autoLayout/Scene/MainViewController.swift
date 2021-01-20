//
//  ViewController.swift
//  autoLayout
//
//  Created by Rodrigo Conte on 13/01/21.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    private func setupTabbar() {
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.image = UIImage(named: "")
        homeVC.tabBarItem.selectedImage = UIImage(named: "")
        
        let libraryVC = LibraryViewController()
        libraryVC.tabBarItem.image = UIImage(named: "")
        libraryVC.tabBarItem.selectedImage = UIImage(named: "")
        
        viewControllers = [homeVC, libraryVC]
        
    }
    
}
