//
//  LoginViewController.swift
//  Tumblr
//
//  Created by James Taylor on 10/10/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.becomeFirstResponder()

    }



    @IBAction func didPressCancel(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
