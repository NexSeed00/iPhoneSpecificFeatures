//
//  ViewController.swift
//  GestureProject
//
//  Created by yonekan on 2019/04/06.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tappedCountLabel: UILabel!
    
    @IBOutlet weak var swipedCountLabel: UILabel!
    
    var tappedCount = 0
    
    var swipedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        tappedCount += 1
        tappedCountLabel.text = "\(tappedCount)"
    }
    
    @IBAction func swipedUp(_ sender: UISwipeGestureRecognizer) {
        swipedCount += 1
        swipedCountLabel.text = "\(swipedCount)"
    }
    
    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        swipedCount += 1
        swipedCountLabel.text = "\(swipedCount)"
    }
    
    @IBAction func swipedDown(_ sender: UISwipeGestureRecognizer) {
        swipedCount += 1
        swipedCountLabel.text = "\(swipedCount)"
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        swipedCount += 1
        swipedCountLabel.text = "\(swipedCount)"
    }
    
}

