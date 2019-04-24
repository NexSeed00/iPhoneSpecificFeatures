//
//  ViewController.swift
//  testUserDefault
//
//  Created by reo on 2019/04/24.
//  Copyright © 2019 ReoOkumura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var colorOpt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userDefault = UserDefaults.standard
        colorOpt = userDefault.integer(forKey: "colorOpt")
        changeBgColor()
        changeLabel()
    }

    @IBAction func didClickBtn(_ sender: Any) {
        if colorOpt == 3 {
            colorOpt = 1
        } else {
            colorOpt += 1
        }
        
        let userDefault = UserDefaults.standard
        userDefault.set(colorOpt, forKey: "colorOpt")
        
        changeBgColor()
        changeLabel()
    }
    
    func changeBgColor() {
        switch colorOpt {
        case 2:
            view.backgroundColor = .lightGray
        case 3:
            view.backgroundColor = .darkGray
        default:
            view.backgroundColor = .white
        }
    }
    
    func changeLabel() {
        switch colorOpt {
        case 2:
            label.text = "LightGray"
        case 3:
            label.text = "DarkGray"
        default:
            label.text = "White"
        }
    }
    
}

