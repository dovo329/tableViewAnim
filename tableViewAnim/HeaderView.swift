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

    //@IBOutlet weak var name: UILabel!
    var name : UILabel = UILabel()
    
    var section : Int?
    
    var delegate : HeaderViewDelegate? = nil
    
    /*override func awakeFromNib() {
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        addGestureRecognizer(tapGesture)
    }*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        addGestureRecognizer(tapGesture)
        
        name.text = "Name"
        self.addSubview(name)
        name.setTranslatesAutoresizingMaskIntoConstraints(false)
        addConstraint(
            NSLayoutConstraint(
                item: name,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0.0))
        addConstraint(
            NSLayoutConstraint(
                item: name,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1.0,
                constant: 0.0))
        name.sizeToFit()
        
        self.contentView.backgroundColor = UIColor.greenColor()
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
