//
//  MainViewController.swift
//  069-MyFavPlace
//
//  Created by Meagan McDonald on 4/21/16.
//  Copyright © 2016 Skyla157. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnOpenMap(sender: AnyObject) {
        let targetURL = NSURL(string: "http://maps.apple.com/?q=Santa%20Barbara%20CA")!
        let isAvailable = UIApplication.sharedApplication().canOpenURL(targetURL)
        if isAvailable {
            UIApplication.sharedApplication().openURL(targetURL)
        }else {
            NSLog("Can't use Apple Maps");
        }
    }

}
