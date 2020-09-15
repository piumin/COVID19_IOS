//
//  ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/12/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var vwContainerhome1:UIView!
    @IBOutlet weak var vwContainerhome2:UIView!
    @IBOutlet weak var vwContainerhome3:UIView!
    @IBOutlet weak var vwContainerhome4:UIView!
     @IBOutlet weak var nibmmapnew: MKMapView!
    private let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vwContainerhome2.layer.cornerRadius = 8.0
        // Set initial location in NIBM
               _ = CLLocation(latitude: 6.9063951, longitude: 79.8684273)
        
        //self.navigationItem.leftBarButtonItem = nil
        //self.navigationItem.hidesBackButton = true
            }
    

}
