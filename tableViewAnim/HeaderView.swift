//
//  HeaderView.swift
//  tableViewAnim
//
//  Created by Douglas Voss on 7/31/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    override func awakeFromNib() {
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        addGestureRecognizer(tapGesture)
    }
    
    func handleTap(sender: UITapGestureRecognizer!) {
        println("header was tapped")
    }
}
