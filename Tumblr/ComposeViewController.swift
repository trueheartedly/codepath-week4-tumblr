//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by James Taylor on 10/10/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didPressCancel(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
