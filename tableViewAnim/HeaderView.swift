//
//  HeaderView.swift
//  tableViewAnim
//
//  Created by Douglas Voss on 7/31/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func tappedOnSection(section: Int)
}

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var name: UILabel!
    
    var section : Int?
    
    var delegate : HeaderViewDelegate? = nil
    
    override func awakeFromNib() {
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        addGestureRecognizer(tapGesture)
    }
    
    func handleTap(sender: UITapGestureRecognizer!) {
        if let section = section {
            println("header section \(section) was tapped")
            if let delegate = delegate {
                delegate.tappedOnSection(section)
            } else {
                println("no delegate! Can't call tapped on method!")
            }
        } else {
            println("header was tapped, but I don't know what section it is")
        }
    }
}
