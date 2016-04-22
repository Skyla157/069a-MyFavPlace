//
//  ImageViewController.swift
//  069-MyFavPlace
//
//  Created by Meagan McDonald on 4/21/16.
//  Copyright © 2016 Skyla157. All rights reserved.
//

import UIKit

class ImagePageViewController: UIPageViewController {
    
    weak var photoDelegate: ImagePageViewControllerDelegate?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be shown in this order
        return [
            self.newPageViewController("page1"),
            self.newPageViewController("page2"),
            self.newPageViewController("page3"),
            self.newPageViewController("page4"),
            self.newPageViewController("page5"),
            self.newPageViewController("page6"),
            self.newPageViewController("page7"),
            self.newPageViewController("page8"),
            self.newPageViewController("page9"),
            self.newPageViewController("page10")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let page1ViewController = orderedViewControllers.first {
            scrollToViewController(page1ViewController)
        }
        
        photoDelegate?.imagePageViewController(self,
            didUpdatePageCount: orderedViewControllers.count)
    }
    
    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self,
                viewControllerAfterViewController: visibleViewController) {
                    scrollToViewController(nextViewController)
        }
    }
    
    func scrollBackToLastController() {
        if let visibleViewController = viewControllers?.first,
            let lastViewController = pageViewController(self,
                viewControllerBeforeViewController: visibleViewController) {
                    scrollToViewController(lastViewController)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates the direction.
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let page1ViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.indexOf(page1ViewController) {
                let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .Forward : .Reverse
                let nextViewController = orderedViewControllers[newIndex]
                scrollToViewController(nextViewController, direction: direction)
        }
    }
    
    private func newPageViewController(page: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(page)ViewController")
    }
    
    /**
     Scrolls to the given 'viewController' page.
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController,
        direction: UIPageViewControllerNavigationDirection = .Forward) {
            setViewControllers([viewController],
                direction: direction,
                animated: true,
                completion: { (finished) -> Void in
                    // Setting the view controller programmatically does not fire
                    // any delegate methods, so we have to manually notify the
                    // 'photoDelegate' of the new index.
                    self.notifyImageDelegateOfNewIndex()
            })
    }
    
    /**
     Notifies '_photoDelegate' that the current page index was updated.
     */
    private func notifyImageDelegateOfNewIndex() {
        if let page1ViewController = viewControllers?.first,
            let index = orderedViewControllers.indexOf(page1ViewController) {
                photoDelegate?.imagePageViewController(self,
                    didUpdatePageIndex: index)
        }
    }
    
}



// MARK: UIPageViewControllerDataSource

extension ImagePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}


extension ImagePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
            notifyImageDelegateOfNewIndex()
    }
    
}

protocol ImagePageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func imagePageViewController(imagePageViewController: ImagePageViewController,
        didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func imagePageViewController(imagePageViewController: ImagePageViewController,
        didUpdatePageIndex index: Int)
    
}










