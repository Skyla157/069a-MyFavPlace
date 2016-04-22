//
//  ViewController.swift
//  069-MyFavPlace
//
//  Created by Meagan McDonald on 4/20/16.
//  Copyright © 2016 Skyla157. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!

    
    var imagePageViewController: ImagePageViewController? {
        didSet {
            imagePageViewController?.photoDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: "didChangePageControlValue", forControlEvents: .ValueChanged)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let imagePageViewController = segue.destinationViewController as? ImagePageViewController {
            self.imagePageViewController = imagePageViewController
        }
    }
    
    //NEXT button
    @IBAction func didTapNextButton(sender: UIButton) {
        imagePageViewController?.scrollToNextViewController()
    }
    
    //BACK button
    @IBAction func didTapBackButton(sender: UIButton) {
        imagePageViewController?.scrollBackToLastController()
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangePageControlValue() {
        imagePageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension ImageViewController: ImagePageViewControllerDelegate {
    
    func imagePageViewController(imagePageViewController: ImagePageViewController,
        didUpdatePageCount count: Int) {
            pageControl.numberOfPages = count
    }
    
    func imagePageViewController(imagePageViewController: ImagePageViewController,
        didUpdatePageIndex index: Int) {
            pageControl.currentPage = index
    }
    
    @IBAction func tapBackToMain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}





























