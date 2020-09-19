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
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var vwContainerhome1:UIView!
    @IBOutlet weak var vwContainerhome2:UIView!
    @IBOutlet weak var vwContainerhome3:UIView!
    @IBOutlet weak var vwContainerhome4:UIView!
    @IBOutlet weak var nibmmapnew: MKMapView!
    @IBOutlet weak var mapButton: UIButton!
    
    @IBOutlet weak var InfectLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("home did load")
        
        vwContainerhome2.layer.cornerRadius = 8.0
        
        setUpElement()
        
        let db = Firestore.firestore()
        
        db.collection("users").whereField("infected", in: [true]).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
             self.InfectLabel.text = String(querySnapshot!.documents.count)
            }
        }
            }
    
    func setUpElement(){
       
        Utilities.mapButton(mapButton)
        
    }
}
