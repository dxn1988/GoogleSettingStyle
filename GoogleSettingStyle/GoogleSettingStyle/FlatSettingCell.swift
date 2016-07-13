//
//  FlatSettingCell.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import UIKit

class FlatSettingCell: UITableViewCell {
    
    var buttons: [BasicButton] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
        updateView()
    }
    
    internal convenience init?(buttons: [BasicButton]) {
        self.init(frame: CGRect.zero)
        addButton(buttons, isInitial: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.selectionStyle = .None
        self.backgroundColor = Constants.Color.SettingBackgroundColor
        self.addSubview(cardView)
    }
    
    internal func addButton(buttons: [BasicButton], isInitial: Bool? = false) {
        for b in buttons {
            self.buttons.append(b)
        }
        if isInitial! {
            print("Initialization:")
        } else {
            print("Add button to a cell:")
        }
        updateView(isInitial)
    }
    
    private func updateView(isInitial: Bool? = false) {
        if !isInitial! {
            clearAllConstraints(self)
        }
        var viewsInCell: [UIView] = []
        
        if buttons.count > 0 {
            self.addConstraintsWithFormat("H:|-\(Constants.SettingCellInterface.CellPaddingLeft)-[v0]-\(Constants.SettingCellInterface.CellPaddingRight)-|", views: [cardView])
            self.addConstraintsWithFormat("V:|-\(Constants.SettingCellInterface.CellPaddingTop)-[v0]-\(Constants.SettingCellInterface.CellPaddingBottom)-|", views: [cardView])
            
            for i in 0..<buttons.count {
                if i >= 1 {
                    // Add divider
                    viewsInCell.append(createDivider())
                }
                viewsInCell.append(buttons[i])
            }
            
            // Add constraints
            var conString = ""
            for k in 0..<viewsInCell.count {
                self.addSubview(viewsInCell[k])
                if k == 0 {
                    self.addConstraintsWithFormat("H:|-\(Constants.SettingCellInterface.CellPaddingLeft)-[v0]-\(Constants.SettingCellInterface.CellPaddingRight)-|", views: [viewsInCell[k]])
                    conString += "[v0(\((viewsInCell[k] as! BasicButton).height))]"
                    print(" -------- ")
                    print("| Button |")
                } else if k % 2 == 1 {
                    // Divider horizontal constraints
                    self.addConstraintsWithFormat("H:|-\(Constants.SettingCellInterface.CellPaddingLeft + Constants.BasicButton.PaddingLeft)-[v0]-\(Constants.SettingCellInterface.CellPaddingRight + Constants.BasicButton.PaddingRight)-|", views: [viewsInCell[k]])
                    // Divider vertical constraints, height only
                    conString += "[v\(k)(\(Constants.SettingCellInterface.DividerHeight))]"
                    print("| ------ |")
                } else {
                    // Button horizontal constraints
                    self.addConstraintsWithFormat("H:|-\(Constants.SettingCellInterface.CellPaddingLeft)-[v0]-\(Constants.SettingCellInterface.CellPaddingRight)-|", views: [viewsInCell[k]])
                    // Button vertical constraints, same height as the very first button
                    conString += "[v\(k)(\((viewsInCell[k] as! BasicButton).height))]"
                    print("| Button |")
                }
            }
            print(" -------- ")
            
            let finalString = "V:|-\(Constants.SettingCellInterface.CellPaddingTop)-" + conString + "-\(Constants.SettingCellInterface.CellPaddingBottom)-|"
            
            // Add vertical constraints
            self.addConstraintsWithFormat(finalString, views: viewsInCell)
            
            // Clear viewsInCell
            viewsInCell.removeAll()
            print(" ")
        }
    }
    
    internal func getHeight() -> CGFloat {
        var buttonHeight: CGFloat = 0
        for button in buttons {
            buttonHeight += button.height
        }
        let dividerHeight = CGFloat(buttons.count - 1) * Constants.SettingCellInterface.DividerHeight
        let space = Constants.SettingCellInterface.CellPaddingTop + Constants.SettingCellInterface.CellPaddingBottom
        return buttons.count > 0 ? (CGFloat(space) + buttonHeight + dividerHeight) : 0
    }
    
    let cardView: UIView = {
        let card = UIView()
        card.backgroundColor = Constants.Color.SettingSectionBackgroundColor
        card.layer.shadowColor = UIColor.blackColor().CGColor
        card.layer.shadowOpacity = 0.25
        card.layer.shadowOffset = CGSizeMake(0, 1)
        card.layer.shadowRadius = 1
        card.layer.cornerRadius = 1
        card.layer.borderWidth = 0.2
        card.layer.borderColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:1.0).CGColor
        return card
    }()
    
    private func createDivider() -> UIView {
        let view = UIView()
        view.backgroundColor = Constants.Color.SettingBackgroundColor
        return view
    }
    
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: [UIView]) {
        var viewsDictionary = [String: UIView]()
        for index in 0..<views.count {
            let key = "v\(index)"
            viewsDictionary[key] = views[index]
            views[index].translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func clearAllConstraints(view: UIView) {
        for c in view.constraints {
            if c.firstItem as! NSObject == self || c.secondItem as! NSObject == self {
                self.removeConstraint(c)
            }
        }
    }
}
