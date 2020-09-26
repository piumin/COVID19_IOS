//
//  MapViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/20/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseFirestore

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager: CLLocationManager?
    
    @IBOutlet weak var MessageUIView: UIView!
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var MessageIcon: UIImageView!
    @IBOutlet weak var MapmessageLabel: UILabel!
    
    var annotationIdentierCount = 0
    
     let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        MapView.delegate = self
        print("full map")
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedAlways || status == .authorizedWhenInUse) {
            locationManager?.startUpdatingLocation()
        } else {
            
        }
    }
    
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if let location = locations.last {
             print("New location is \(location)")
             
             let regionRadius: CLLocationDistance = 500
             let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
             let region = MKCoordinateRegion(center: center, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
             self.MapView.setRegion(region, animated: true)
             let myPin = MKPointAnnotation()
             myPin.coordinate = center
             myPin.title = "Me"
             MapView.addAnnotation(myPin)
             
             let radius  = 500.00
             let coef = radius * 0.0000089
             let new_lat = location.coordinate.latitude + coef
             let new_lon = location.coordinate.longitude + coef / cos(location.coordinate.longitude * 0.018)
             
             print("new coord")
             print(new_lat)
             print(new_lon)
             
             db.collection("users").whereField("location", isLessThanOrEqualTo: GeoPoint(latitude: new_lat, longitude: new_lon))
                 .whereField("infected", isEqualTo: true)
                 .getDocuments() { (querySnapshot, err) in
                 if let err = err {
                     print("Error getting documents: \(err)")
                 } else {
                     if(querySnapshot!.count == 0){
                         self.MapmessageLabel.text = "Your area is safe"
                         self.MessageIcon.image = UIImage(named: "shield")
                         self.MessageUIView.isHidden = false
                     } else {
                         self.MapmessageLabel.text = "Your are not safe"
                         self.MessageIcon.image = UIImage(named: "warning")
                         self.MessageUIView.isHidden = false
                     }
                     
                     var h = UserDefaults.standard.string(forKey: "id")
                     if(h != nil){
                         h = h!
                     }
                     
                      for document in querySnapshot!.documents {
                         if(document.documentID != h){
                             
                             let location_temp = document.get("location")
                             //print(location_temp)
                             if(location_temp != nil){
                                 let geo_location = location_temp as? GeoPoint
                                 let temp_lat = Double(geo_location!.latitude)
                                 let temp_lon = Double(geo_location!.longitude)
                                 
                                 //print(temp_lon)
                                 
                                 let pin = MKPointAnnotation()
                                 let center = CLLocationCoordinate2D(latitude: temp_lat, longitude: temp_lon)
                                 pin.coordinate = center
                                 pin.title = "Infected"
                                 self.MapView.addAnnotation(pin)
                             }
                             
                         }
                     }
                 }
             }
            
         }
     }
     
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         guard !annotation.isKind(of: MKUserLocation.self) else {
             // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
             print("before nil")
             return nil
         }
         
         
         
         let title = annotation.title!!
         annotationIdentierCount += 1
         let iden = title + String(annotationIdentierCount)
         //print(title)
         //print(iden)
         
         let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: iden)
         
         
         if(title == "Me"){
             annotationView.image = UIImage(named: "blueDot")
         } else if(title == "Infected"){
             annotationView.image = UIImage(named: "infectedLocation")
         }
         
         return annotationView
     }
}
