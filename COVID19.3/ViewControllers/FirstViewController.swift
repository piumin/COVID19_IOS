//
//  FirstViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/12/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FirstViewController: UIViewController {

    @IBOutlet weak var notifyUIView: UIView!
    @IBOutlet weak var SurveyLabel: UIView!    
    @IBOutlet weak var UpdateUIView: UIView!
    @IBOutlet weak var UpdateButton: UIButton!
    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = UserDefaults.standard.string(forKey: "id")

               let ref = db.collection("users").document(id!)
               ref.getDocument { (document, error) in
                   if let document = document, document.exists {
                        let last_temp = document.get("last_temp")
                        let last_date = document.get("last_time")

                        if(last_temp != nil){
                           var str = last_temp as?  String
                           str = str!
                           self.TempLabel.text = str!
                        }

                        if(last_date != nil){
                           var str = last_date as?  String
                           str = str!
                           self.DateLabel.text = "Last updated: " + str!
                           self.DateLabel.isHidden = false
                        }
                   } else {
                       print("Document does not exist")
                   }
               }
        
        
        setUpElement()
        
    }
    
//    override func viewWillAppear(_ animated: Bool){
//        if(!UserDefaults.standard.bool(forKey: "is_logged")) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "SigninCV") as UIViewController
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
   
    func setUpElement(){
         
        Utilities.styleFilledView(notifyUIView)
        Utilities.styleFilledView(UpdateUIView)
        Utilities.styleFilledView(SurveyLabel)
        Utilities.styleFilledView(tempTextField)
        Utilities.updateButton(UpdateButton)
        
     }
    
    @IBAction func updateButtontapped(_ sender: Any) {
        
        ErrorLabel.isHidden = true
        let temp = tempTextField.text!
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "MM-dd HH:mm"
        let datetime = format.string(from: date)
        
        print(datetime)
        print(temp)
        
        if(temp.count == 0) {
            ErrorLabel.text = "Please enter temperature"
            ErrorLabel.isHidden = false
            return
        }
        
        UpdateButton.isEnabled = false
        
        let id = UserDefaults.standard.string(forKey: "id")
        
        let ref = db.collection("users").document(id!)
        ref.updateData(["last_temp": temp, "last_time": datetime]){ err in
            if let err = err {
                print("Error updating document: \(err)")
                self.ErrorLabel.text = "Error occured"
                self.ErrorLabel.isHidden = false
            } else {
                print("Document successfully updated")
                self.UpdateButton.isEnabled = true
                self.TempLabel.text = temp
                self.DateLabel.text = datetime
            }
        }
    }
    
    
    @IBAction func NewsurveyButtonTapped(_ sender: UIButton) {
         if(TempLabel.text != "00") {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Survey1") as UIViewController
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                ErrorLabel.text = "Please enter temperature first"
                ErrorLabel.isHidden = false
                return
            }
    }
}



