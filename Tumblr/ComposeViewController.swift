//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by James Taylor on 10/10/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {


    // create outlets to buttons
    @IBOutlet weak var composeTextButton: UIButton!
    @IBOutlet weak var composePhotoButton: UIButton!
    @IBOutlet weak var composeQuoteButton: UIButton!
    @IBOutlet weak var composeLinkButton: UIButton!
    @IBOutlet weak var composeChatButton: UIButton!
    @IBOutlet weak var composeVideoButton: UIButton!
    
    var composeTextButtonOrigin: CGPoint!
    var composePhotoButtonOrigin: CGPoint!
    var composeQuoteButtonOrigin: CGPoint!
    var composeLinkButtonOrigin: CGPoint!
    var composeChatButtonOrigin: CGPoint!
    var composeVideoButtonOrigin: CGPoint!
    
    var viewTop: CGFloat!
    var viewBottom: CGFloat!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewTop = -composeTextButton.frame.height
        viewBottom = view.frame.size.height
        
        composeTextButtonOrigin = composeTextButton.center
        composePhotoButtonOrigin = composePhotoButton.center
        composeQuoteButtonOrigin = composeQuoteButton.center
        composeLinkButtonOrigin = composeLinkButton.center
        composeChatButtonOrigin = composeChatButton.center
        composeVideoButtonOrigin = composeVideoButton.center
        
        composeTextButton.frame.origin.y  = viewBottom
        composePhotoButton.frame.origin.y = viewBottom
        composeQuoteButton.frame.origin.y = viewBottom
        composeLinkButton.frame.origin.y = viewBottom
        composeChatButton.frame.origin.y = viewBottom
        composeVideoButton.frame.origin.y = viewBottom
        
    }

    override func viewDidAppear(animated: Bool) {
        transitionButtonsIn()
    }
    
    
    func transitionButtonsIn() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeTextButton.center.y = self.composeTextButtonOrigin.y
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.05, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composePhotoButton.center.y = self.composePhotoButtonOrigin.y
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeQuoteButton.center.y = self.composeQuoteButtonOrigin.y
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeLinkButton.center.y = self.composeLinkButtonOrigin.y
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeChatButton.center.y = self.composeChatButtonOrigin.y
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.25, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeVideoButton.center.y = self.composeVideoButtonOrigin.y
            }) { (Bool) -> Void in
        }
    }
    
    func transitionButtonsOut() {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeTextButton.center.y = self.viewTop
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.05, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composePhotoButton.center.y = self.viewTop
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeQuoteButton.center.y = self.viewTop
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeLinkButton.center.y = self.viewTop
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeChatButton.center.y = self.viewTop
            }) { (Bool) -> Void in
        }
        UIView.animateWithDuration(0.3, delay: 0.25, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.composeVideoButton.center.y = self.viewTop
            }) { (Bool) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    @IBAction func didPressCancel(sender: UIButton) {
        transitionButtonsOut()
    }

}