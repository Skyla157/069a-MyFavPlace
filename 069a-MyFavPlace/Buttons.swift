//
//  Buttons.swift
//  069-MyFavPlace
//
//  Created by Meagan McDonald on 4/21/16.
//  Copyright © 2016 Skyla157. All rights reserved.
//

import UIKit

class Buttons: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 7.0
        backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
        //setTitleColor(UIColor.whiteColor(), forState: .Normal)
        setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1), forState: .Normal)
        titleLabel?.font = UIFont(name: "CaviarDreams-Bold", size: 15)
    }
    
}
