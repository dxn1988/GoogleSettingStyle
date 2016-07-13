//
//  ViewController.swift
//  GoogleSettingStyle
//
//  Created by Dong Xuening on 16/7/13.
//  Copyright © 2016年 DONG.XN. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var cells: [FlatSettingCell] = []
    
    var cell1: FlatSettingCell!
    var cell2: FlatSettingCell!
    var cell3: FlatSettingCell!
    
    var item1: BasicButton!
    var item2: BasicButton!
    var item3: BasicButton!
    var item4: BasicButton!
    var item5: BasicButton!
    var item6: CheckButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initButton()
        initCell()
        initList()
    }
    
    func initView() {
        self.navigationItem.title = "Google Style Setting"
        self.tableView.backgroundColor = Constants.Color.SettingBackgroundColor
        self.tableView.separatorStyle = .None
    }
    
    func initButton() {
        item1 = BasicButton(title: "Setting Item 1")
        item2 = BasicButton(title: "Normal Text", bold: false, leftTextSize: 14, leftTextColor: Constants.BasicButton.DefaultTextColor, enabled: true)
        item3 = BasicButton(title: "Larger Font", bold: false, leftTextSize: 18, leftTextColor: Constants.BasicButton.DefaultTextColor, enabled: true)
        item4 = BasicButton(title: "Red Text (Disabled)", bold: false, leftTextSize: 14, leftTextColor: UIColor.redColor(), enabled: false)
        item5 = BasicButton(title: "TableView Bounce")
        item6 = CheckButton(title: "Check Button")
        
        item1.tag = 1
        item2.tag = 2
        item3.tag = 3
        item4.tag = 4
        
        item1.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        item2.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        item3.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        item4.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        item5.addTarget(self, action: #selector(changeBounce), forControlEvents: .TouchUpInside)
        item6.addTarget(self, action: #selector(updateCheck), forControlEvents: .TouchUpInside)
    }
    
    func initCell() {
        print("cell1")
        cell1 = FlatSettingCell(buttons: [item1, item4])
        print("cell2")
        cell2 = FlatSettingCell(buttons: [item2, item3])
        print("cell3")
        cell3 = FlatSettingCell()
        cell3.addButton([item5, item6])
    }
    
    func initList() {
        cells = [cell1, cell2, cell3]
    }
    
    func buttonAction(sender: UIButton) {
        self.navigationItem.title = "Button \(sender.tag) pressed!"
    }
    
    func changeBounce() {
        tableView.bounces = !tableView.bounces
        self.navigationItem.title = tableView.bounces ? "Bounce On" : "Bounce Off"
    }
    
    func updateCheck(sender: CheckButton) {
        sender.on = !sender.on
        self.navigationItem.title = sender.on ? "Checked!" : "Unchecked!"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cells[indexPath.row].getHeight()
    }
    
}

