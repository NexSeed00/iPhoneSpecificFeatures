//
//  ViewController.swift
//  MapProject
//
//  Created by yonekan on 2019/04/07.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2DMake(40.6156, -74.7706)
        
        mapView.setCenter(location, animated: true)
        
        let myPin: MKPointAnnotation = MKPointAnnotation()
        
        let center = CLLocationCoordinate2DMake(40.6892, -74.0445);
        // 座標を設定.
        myPin.coordinate = center
        
        // タイトルを設定.
        myPin.title = "自由の女神"
        
        // サブタイトルを設定.
        myPin.subtitle = "いつか見てみたい自由の女神"
        
        mapView.addAnnotation(myPin)
    }

}

