//
//  BasicButton.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import UIKit

class BasicButton: UIButton {
    
    private var _buttonHeight: CGFloat = Constants.BasicButton.DefaultHeight
    
    var height: CGFloat {
        get {
            return _buttonHeight
        }
        set (newValue) {
            _buttonHeight = newValue
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    internal convenience init?(title: String, bold: Bool? = true, leftTextSize: CGFloat? = 14, leftTextColor: UIColor? = Constants.BasicButton.DefaultTextColor, enabled: Bool? = true) {
        self.init(frame: CGRect.zero)
        initView()
        self.enabled = enabled!
        leftLabel.text = title
        leftLabel.font = bold! ? UIFont.boldSystemFontOfSize(leftTextSize!) : UIFont.systemFontOfSize(leftTextSize!)
        leftLabel.textColor = leftTextColor!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.addSubview(leftLabel)
        self.addConstraintsWithFormat("H:|-\(Constants.BasicButton.PaddingLeft)-[v0]-\(Constants.BasicButton.PaddingRight)-|", views: [leftLabel])
        self.addConstraintsWithFormat("V:|[v0]|", views: [leftLabel])
    }
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        return label
    }()
    
}
