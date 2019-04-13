//
//  ViewController.swift
//  SNSShareProject
//
//  Created by yonekan on 2019/04/07.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        let data = [imageView.image!, "猫の写真です"] as [Any]
        let controller = UIActivityViewController(activityItems: data, applicationActivities: nil)
        
        present(controller, animated: true, completion: nil)
    }
    
}

