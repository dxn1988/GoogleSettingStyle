//
//  FlatTabBarController.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import UIKit

class FlatTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView() {
        
        let navigationController = FlatNavigationController(rootViewController: ViewController())
        navigationController.tabBarItem.image = UIImage(named: "mario")
        navigationController.tabBarItem.title = "Menu"
        
        viewControllers = [navigationController]
        
        self.tabBar.tintColor = UIColor.whiteColor()
        self.tabBar.barTintColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0)
    }
    
}
