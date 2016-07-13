//
//  AppData.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Color {
        static let SettingBackgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        static let SettingSectionBackgroundColor = UIColor.whiteColor()
    }
    
    struct SettingCellInterface {
        static let CellPaddingTop: Double = 8
        static let CellPaddingBottom = CellPaddingTop
        static let CellPaddingLeft: Double = 8
        static let CellPaddingRight = CellPaddingLeft
        static let DividerHeight: CGFloat = 0.5
        static let DividerColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.0)
    }
    
    struct BasicButton {
        static let DefaultHeight: CGFloat = 50
        static let PaddingLeft: Double = 16
        static let PaddingRight: Double = PaddingLeft
        static let DefaultTextColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0)
    }
}
