//
//  survey4ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import MapKit
import FirebaseFirestore
import  CoreLocation

class survey4ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    @IBOutlet weak var Survey4Label: UILabel!
    @IBOutlet weak var Survey4YesButton: UIButton!
    @IBOutlet weak var Survey4NoButton: UIButton!

    var is_gps_allowed = false
    var gps_location: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

        
        setUpElement()
    }

    func setUpElement(){
      
        Utilities.styleLabel(Survey4Label)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedAlways || status == .authorizedWhenInUse) {
            locationManager?.startUpdatingLocation()
            is_gps_allowed = true
        } else {
            is_gps_allowed = false
            gps_location = CLLocation(latitude: 6.9063951, longitude: 79.8684273)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("New location is \(location)")
            gps_location = location
        }
    }
    
    @IBAction func survey4ButtonYesTapped(_ sender: Any) {
        
        Survey4Label.text = "Yes"
        que4 = true
        Actions()
    }
    
    
    @IBAction func survey4NoTapped(_ sender: Any) {
        
        Survey4Label.text = "Nope"
        que4 = false
        Actions()
    }
    
    func Actions(){
        var infected = false
       
        let temp = UserDefaults.standard.integer(forKey: "last_temp")
        
        if(que1 && que2 && que3 && que4 && temp >= 37){
            infected = true
        } else if(que1 && que2 && que3 && que4 && temp < 37){
            infected = true
        } else if(que4 && temp >= 37){
            infected = true
        }
    
        let id = UserDefaults.standard.string(forKey: "id")
        let db = Firestore.firestore()
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "MM-dd HH:mm"
        let datetime = format.string(from: date)
        
        let ref = db.collection("users").document(id!)
        
        if(infected){
            ref.updateData(["infected": true, "location":
                ["lon": gps_location?.coordinate.longitude,
                 "lat": gps_location?.coordinate.latitude],
                            "last_time": datetime]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
        else {
            ref.updateData(["infected": false, "location":
                ["lon": gps_location?.coordinate.longitude,
                 "lat": gps_location?.coordinate.latitude],
                            "last_time": datetime]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
    }
}
