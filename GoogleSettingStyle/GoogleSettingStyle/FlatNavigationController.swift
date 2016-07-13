//
//  FlatnavigationController.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import UIKit

class FlatNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationBar.barTintColor = UIColor(red:0.22, green:0.29, blue:0.67, alpha:1.0)
    }
}
