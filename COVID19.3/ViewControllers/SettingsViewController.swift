//
//  SettingsViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/19/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBOutlet weak var ProfileLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           if(UserDefaults.standard.bool(forKey: "is_logged")){
               ProfileLabel.isHidden = false
               profileButton.isHidden = false
               logoutButton.isHidden = false}
       
       }
   

    @IBAction func LogoutButtonTapped(_ sender: UIButton) {
            do {
                  try Auth.auth().signOut()
                  UserDefaults.standard.set("null", forKey: "id")
                  UserDefaults.standard.set("null", forKey: "email")
                  UserDefaults.standard.set("null", forKey: "password")
                  UserDefaults.standard.set(false, forKey: "is_logged")
                  
                  ProfileLabel.isHidden = true
                  profileButton.isHidden = true
                  logoutButton.isHidden = true
                 } catch let signOutError as NSError {
                   print ("Error signing out: %@", signOutError)
                 }
                  
              }
    
    
}
