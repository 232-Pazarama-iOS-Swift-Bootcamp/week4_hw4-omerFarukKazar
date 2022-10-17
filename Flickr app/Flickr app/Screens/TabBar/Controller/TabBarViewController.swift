//
//  TabBarViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 17.10.2022.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let vc1 = FeedTabViewController()
        let vc2 = SearchTabViewController()
        let vc3 = ProfileTabViewController()
        
        vc1.title = "Feed"
        vc2.title = "Search"
        vc3.title = "Profile"
        
        self.setViewControllers([vc1, vc2, vc3], animated: false)
        self.tabBar.backgroundColor = .gray
        
        
        guard let items = self.tabBar.items else { return }
        let sfSymbolNames = ["house", "magnifyingglass", "person.crop.circle"]
        for i in 0..<sfSymbolNames.count {
            items[i].image = UIImage(systemName: sfSymbolNames[i])
        }
    }


}
