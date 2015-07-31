//
//  ViewController.swift
//  tableViewAnim
//
//  Created by Douglas Voss on 7/31/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

let kCellId = "cell.id"
let kSectionHeaderId = "section.header.id"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HeaderViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // will be initialized in viewDidLoad so use Implicit Unwrap
    let nameArray = [Name(first: "Doug", last: "Voss"), Name(first: "Stephen", last: "Viramontes"), Name(first: "Skyler", last: "Clark")]
    var sectionExpanded = [Bool](count: 3, repeatedValue: true)
    var toggle : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.registerClass(HeaderView.self, forHeaderFooterViewReuseIdentifier: kSectionHeaderId)
        /*
        var sectionHeaderNib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.registerNib(sectionHeaderNib, forHeaderFooterViewReuseIdentifier: kSectionHeaderId)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(kSectionHeaderId) as! HeaderView

        headerView.delegate = self
        headerView.section = section
        headerView.name.text = String(format:"name %d", section)
        
        return headerView
    }
    
    // MARK: HeaderViewDelegate method
    func tappedOnSection(section: Int) {
        let expanded = sectionExpanded[section]
        
        tableView.beginUpdates()
        if !expanded {
            let animation = UITableViewRowAnimation(rawValue: UITableViewRowAnimation.Bottom.rawValue)!
            tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: section), NSIndexPath(forRow: 1, inSection: section)], withRowAnimation: animation)
        } else {
            let animation = UITableViewRowAnimation(rawValue: UITableViewRowAnimation.Top.rawValue)!
            tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: section), NSIndexPath(forRow: 1, inSection: section)], withRowAnimation: animation)
        }
        sectionExpanded[section] = !sectionExpanded[section]
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return indexPath.row*5
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return nameArray.count
    }
    
    /*func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String(format:"Name %d", section)
    }*/
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 25.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellId, forIndexPath: indexPath) as! UITableViewCell
        
        var name = nameArray[indexPath.section]
        cell.textLabel!.text = indexPath.row == 0 ? name.first : name.last

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*if section == 0 {
            return sectionExpanded[0] ? 2 : 0
        } else {
            return 2
        }*/
        return sectionExpanded[section] ? 2 : 0
    }
}

