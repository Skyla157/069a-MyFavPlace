//
//  DetailsViewController.swift
//  069-MyFavPlace
//
//  Created by Meagan McDonald on 4/22/16.
//  Copyright © 2016 Skyla157. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var aboutTextViewField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.aboutTextViewField.scrollRangeToVisible(NSMakeRange(0, 0))
    }

    @IBAction func tapToGoBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
