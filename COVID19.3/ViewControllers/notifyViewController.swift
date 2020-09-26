//
//  notifyViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/24/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseFirestore

class notifyViewController: UIViewController {

    @IBOutlet weak var desText: UITextView!
    @IBOutlet weak var headerText: UITextView!
    @IBOutlet weak var publishText: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    
    func setUpElement(){
      
        //Utilities.roundImageView(desText)
        //Utilities.updateButton(ProfileUpdateButton)
        Utilities.notifyText(desText)
        Utilities.notifyText(headerText)
        Utilities.updateButton(publishText)
     
    }
    
    
    @IBAction func publishButtonTapped(_ sender: UIButton) {
        
         let title_text = headerText.text!
               let body_text = desText.text!
               
               if(title_text.count > 1 && body_text.count > 1){
                   publishText.isEnabled = false
                    let db = Firestore.firestore()
                   db.collection("news").document("1").setData( [
                       "title": title_text,
                       "body": body_text
                   ]) { err in
                       if let err = err {
                           print("Error adding document: \(err)")
                           self.publishText.isEnabled = true
                           self.headerText.text = ""
                           self.desText.text = ""
                       } else {
                           print("Document added")
                           self.publishText.isEnabled = true
                           self.headerText.text = ""
                           self.desText.text = ""
                           
                           let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           let vc = storyboard.instantiateViewController(withIdentifier: "UpdateVC") as UIViewController
                           self.navigationController?.pushViewController(vc, animated: true)
                       }
                   }
                   
               }
    }
}
