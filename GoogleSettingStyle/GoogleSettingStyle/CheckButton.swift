//
//  CheckButton.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import Foundation
import UIKit

class CheckButton: BasicButton {
    
    private var _isOn: Bool = true
    
    var on: Bool {
        get {
            return _isOn
        }
        set (newValue) {
            _isOn = newValue
            updateCheck(newValue)
        }
    }
    
    override var height: CGFloat {
        get {
            return super.height
        }
        set {
            return
        }
    }
    
    override func initView() {
        super.initView()
        updateCheck(on)
        self.addSubview(checkImage)
        self.addConstraintsWithFormat("H:[v0]-\(Constants.BasicButton.PaddingRight)-|", views: [checkImage])
        self.addConstraintsWithFormat("V:|-\((super.height - 18) / 2)-[v0]", views: [checkImage])
    }
    
    func updateCheck(on: Bool) {
        checkImage.alpha = on ? 1 : 0
    }
    
    let checkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRectMake(0, 0, 18, 18)
        imageView.contentMode = .ScaleAspectFill
        imageView.image = UIImage(named: "checkmark")
        return imageView
    }()
}
