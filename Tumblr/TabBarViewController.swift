//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by James Taylor on 10/10/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var bobbingTooltip: UIImageView!
    var bobbingTooltipOriginY: CGFloat!
    
    // content view outlet
    @IBOutlet weak var contentView: UIView!
    
    // one outlet array that all tab bar buttons connect to
    @IBOutlet var buttons: [UIButton]!
    
    // set variables for each tab view
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    // array of tab views
    var viewControllers: [UIViewController]!
    
    // keep track of selected tab, set to home view initially
    var selectedIndex: Int = 0
    
    
    // loading image
    @IBOutlet weak var imageView: UIImageView!
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        bobbingTooltipOriginY = bobbingTooltip.center.y

        // instantiate each view controller
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        // add each view controllers to the view controller array
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        // set initial selected button (home)
        buttons[selectedIndex].selected = true
        
        // set up button function
        didPressTab(buttons[selectedIndex])
        
        // loading animation
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        imageView.image = animatedImage

    }


    
    // one button array that all tab bar buttons connect to
    @IBAction func didPressTab(sender: UIButton) {
        
        // set previous screen number in view
        let previousIndex = selectedIndex
        
        // set selecteed screen number
        selectedIndex = sender.tag
        
        // set previous view controller
        let previousVC = viewControllers[previousIndex]
        
        // set current view controller
        let currentVC = viewControllers[selectedIndex]

        // turn off previous button
        buttons[previousIndex].selected = false
        
        // turn on current button
        sender.selected = true

        // remove the previous view controller
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // display selected view controller, set size
        addChildViewController(currentVC)
        currentVC.view.frame = contentView.bounds
        contentView.addSubview(currentVC.view)
        
        currentVC.didMoveToParentViewController(self)
        //print("previous screen = \(previousVC)")
        //print("current screen = \(currentVC) and selected index is \(selectedIndex)")
        
        
        // bobbing tooltip
        if selectedIndex == 1 {
            bobbingTooltip.hidden = true
            
            // fake loading delay to see loading animation
            contentView.hidden = true
            delay(1) {
                self.contentView.hidden = false
            }
        } else {
            bobbingTooltip.hidden = false
            UIView.animateWithDuration(1, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
                    self.bobbingTooltip.center.y = self.bobbingTooltipOriginY - 10
                }, completion: { (Bool) -> Void in
            })
        }

        
        
    }
    
    // delay closure
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    
    // ComposeView custom modal transition
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    var isPresenting: Bool = true
        
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }       
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView!.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
}
