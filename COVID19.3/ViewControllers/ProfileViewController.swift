//
//  ProfileViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ProfileViewController: UIViewController {

@IBOutlet weak var cameraImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ProfileUpdateButton: UIButton!
    @IBOutlet weak var Templabel: UILabel!
    @IBOutlet weak var FnameText: UITextField!
    @IBOutlet weak var BranchText: UITextField!
    @IBOutlet weak var IndexText: UITextField!
    @IBOutlet weak var LnameText: UITextField!
    @IBOutlet weak var UpdateButton: UIButton!
    
    let db = Firestore.firestore()
    let id = UserDefaults.standard.string(forKey: "id")
    
    override func viewDidLoad() {
        super.viewDidLoad()

                let ref = db.collection("users").document(id!)
                ref.getDocument { (document, error) in
                if let document = document, document.exists {
                    let last_temp = document.get("last_temp")
                    let first_name = document.get("first_name")
                    let last_name = document.get("last_name")
                    let index = document.get("index")
                    let branch = document.get("branch")
                           
                           if(last_temp != nil){
                               let str = last_temp as?  String
                               self.Templabel.text = str! + "C"
                           }
                           if(first_name != nil && last_name != nil){
                               let f_name = first_name as? String
                               let l_name = last_name as? String
                               self.NameLabel.text = f_name! + " " + l_name!
                               
                               self.FnameText.placeholder = f_name!
                               self.FnameText.placeholder = l_name!
                           }
                           if(index != nil){
                               let ind = index as? String
                               self.IndexText.placeholder = ind!
                           }
                           if(branch != nil){
                               let brn = branch as? String
                               self.BranchText.placeholder = brn!
                           }
                          } else {
                              print("Document does not exist")
                          }
                      }
        
        setUpElement()
    }
    
    func setUpElement(){
      
        Utilities.roundImageView(cameraImageView)
        Utilities.updateButton(ProfileUpdateButton)
     
    }
   

    @IBAction func UpdateButtonTapped(_ sender: UIButton) {
        
             let f_name = FnameText.text!
             let l_name = LnameText.text!
             let ind = IndexText.text!
             let brn = BranchText.text!
             
             var data: [String: String] = [:]
             
             if(f_name.trimmingCharacters(in: .whitespacesAndNewlines) != ""){
                 data["first_name"] = f_name
                 FnameText.placeholder = f_name
                 FnameText.text = nil
             }
             if(l_name.trimmingCharacters(in: .whitespacesAndNewlines) != ""){
                 data["last_name"] = l_name
                 LnameText.placeholder = l_name
                 LnameText.text = nil
             }
             if(ind.trimmingCharacters(in: .whitespacesAndNewlines) != ""){
                 data["index"] = ind
                 IndexText.placeholder = ind
                 IndexText.text = nil
             }
             if(brn.trimmingCharacters(in: .whitespacesAndNewlines) != ""){
                 data["branch"] = brn
                 BranchText.placeholder = brn
                 BranchText.text = nil
             }
             
             if(!data.isEmpty){
                 self.UpdateButton.isEnabled = false
                 let ref = db.collection("users").document(id!)
                 ref.updateData(data){ err in
                     if let err = err {
                         print("Error updating document: \(err)")
                         self.UpdateButton.isEnabled = true
                     } else {
                         print("Document successfully updated")
                         self.UpdateButton.isEnabled = true
                     }
                 }
            }
         }
    }
