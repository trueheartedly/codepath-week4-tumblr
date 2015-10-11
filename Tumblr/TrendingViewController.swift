//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by James Taylor on 10/10/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = imageView.image!.size
        
    }
}
