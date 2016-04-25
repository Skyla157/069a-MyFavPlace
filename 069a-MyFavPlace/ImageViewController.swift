//
//  ViewController.swift
//  069b-MyFavPlace
//
//  Created by Meagan McDonald on 4/22/16.
//  Copyright © 2016 Skyla157. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoTitleLbl: UILabel!
    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var numLbl: UILabel!
    
    var count: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 1
        
        loadImageAndLabel(count)
    }
    
    @IBAction func onBackBtnPress(sender: AnyObject) {
        decreaseInt(&count)
        loadImageAndLabel(count)
    }
    
    
    @IBAction func onNextButtonPress(sender: AnyObject) {
        increaseInt(&count)
        loadImageAndLabel(count)
    }
    
    func loadImageAndLabel(i: Int) {
        switch i {
        case 1:
            photoImg.image = UIImage(named: "1StateStreet")
            photoTitleLbl.text = "State Street"
        case 2:
            photoImg.image = UIImage(named: "2ButterflyBeach")
            photoTitleLbl.text = "Butterfly Beach"
        case 3:
            photoImg.image = UIImage(named: "3SaddleRock")
            photoTitleLbl.text = "Saddle Rock Loop"
        case 4:
            photoImg.image = UIImage(named: "4Zoo")
            photoTitleLbl.text = "Santa Barbara Zoo"
        case 5:
            photoImg.image = UIImage(named: "5HendryBeach")
            photoTitleLbl.text = "Hendry's Beach"
        case 6:
            photoImg.image = UIImage(named: "6SternsWarf")
            photoTitleLbl.text = "Stearns Wharf"
        case 7:
            photoImg.image = UIImage(named: "7ChromaticGate")
            photoTitleLbl.text = "The Chromatic Gate"
        case 8:
            photoImg.image = UIImage(named: "8ArroyoBurroBeach")
            photoTitleLbl.text = "Arroyo Burro Beach"
        case 9:
            photoImg.image = UIImage(named: "9BotanicGarden")
            photoTitleLbl.text = "Santa Barbara Botanic Garden"
        case 10:
            photoImg.image = UIImage(named: "10Wineries")
            photoTitleLbl.text = "Wineries"
        default:
            print("Bad Number")
        }
        numLbl.text = "\(i) of 10"
        
    }
    
    func increaseInt(inout i: Int) {
        if i == 10 {
            i = 1
        } else {
            i = i + 1
        }
    }
    
    func decreaseInt(inout i: Int) {
        if i == 1 {
            i = 10
        } else {
            i = i - 1
        }
    }
    
    @IBAction func tapToGoBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

