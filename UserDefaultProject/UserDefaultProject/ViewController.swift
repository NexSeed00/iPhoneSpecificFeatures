//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by yonekan on 2019/04/06.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        count = userDefault.integer(forKey: "currentCount")
        label.text = "\(count)"
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        count += 1
        label.text = "\(count)"
        
        let userDefault = UserDefaults.standard
        userDefault.set(count, forKey: "currentCount")
        
    }
    
}

