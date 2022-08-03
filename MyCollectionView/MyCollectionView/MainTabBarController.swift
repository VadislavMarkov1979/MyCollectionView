//
//  MainTabBarController.swift
//  MyCollectionView
//
//  Created by Владимир on 09.07.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let listViewController = ListViewController()
        let gridViewController = GridViewController()
        let nestedGroupsViewController = NestedGroupsViewController()
        let orthogonalScroll = OrthogonalScrollBehaviorViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        let carImage = UIImage(systemName: "car", withConfiguration: boldConfig)!
        let filImage = UIImage(systemName: "message", withConfiguration: boldConfig)!
        
        viewControllers = [
           generateNavigationController(rootViewController: listViewController, title: "List", image: carImage),
           generateNavigationController(rootViewController: gridViewController, title: "Grid", image: peopleImage),
           generateNavigationController(rootViewController: nestedGroupsViewController, title: "Nested", image: convImage),
           generateNavigationController(rootViewController: orthogonalScroll, title: "Ortogonal", image: filImage)
           
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
}
