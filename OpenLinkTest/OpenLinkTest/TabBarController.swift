//
//  TabBarController.swift
//  OpenLinkTest
//
//  Created by apple on 2023/07/06.
//

import UIKit

class TabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setup()
  }
  
  private func setup() {
    let firstNavigation: UINavigationController = .init(rootViewController: FirstVC())
    let secondNavigation: UINavigationController = .init(rootViewController: SecondVC())
    let thirdNavigation: UINavigationController = .init(rootViewController: ThirdVC())
    
    let naviArray = [firstNavigation, secondNavigation, thirdNavigation]
    for (i, navi) in naviArray.enumerated() {
      navi.tabBarItem = .init(tabBarSystemItem: .init(rawValue: i) ?? .more, tag: i)
    }
    
    self.viewControllers = naviArray
    self.tabBar.backgroundColor = .white
    self.tabBar.barTintColor = .gray
    self.tabBar.isTranslucent = false
    
    self.selectedIndex = 0
  }
}
