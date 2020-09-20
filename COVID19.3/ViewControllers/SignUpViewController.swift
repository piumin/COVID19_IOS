//
//  SignUpViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/14/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var FnameTextField: UITextField!
    @IBOutlet weak var LnameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var RoleTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var S_ErrorLabel: UILabel!
    @IBOutlet weak var AccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
        
    }
    func setUpElement(){
       
        Utilities.styleFilledButton(signupButton)
        Utilities.styleFilledButton(AccountButton)
            
}

    @IBAction func signupTapped(_ sender: Any) {
        
         S_ErrorLabel.isHidden = true
           
           let f_name = FnameTextField.text!
           let l_name = LnameTextField.text!
           let _role = RoleTextField.text!
           let _email = EmailTextField.text!
           let _password = PasswordTextField.text!
           
           
           if(f_name.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               l_name.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               _email.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               _password.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               _role.trimmingCharacters(in: .whitespacesAndNewlines) == ""
               ) {
               S_ErrorLabel.text = "Please fill all fields"
               S_ErrorLabel.isHidden = false
               return
           }
           
           if(_role == "student" || _role == "staff" || _role == "other"){

           } else {
               S_ErrorLabel.text = "Invalid option in Role"
               S_ErrorLabel.isHidden = false
               return
           }

            if(_password.count < 6){
               S_ErrorLabel.text = "Password must be at least 6 characters long"
               S_ErrorLabel.isHidden = false
               return
           }
           
           signupButton.isEnabled = false
           AccountButton.isEnabled = false
           
           Auth.auth().createUser(withEmail: _email, password: _password) { authResult, error in
               
               if(error != nil) {
                   self.S_ErrorLabel.text = "Error occured"
                   self.S_ErrorLabel.isHidden = false
               }
               
               let id = authResult?.user.uid
               
               UserDefaults.standard.set(id!, forKey: "id")
               UserDefaults.standard.set(_email, forKey: "email")
               UserDefaults.standard.set(_password, forKey: "password")
               UserDefaults.standard.set(true, forKey: "is_logged")
               
               let db = Firestore.firestore()
               
               db.collection("users").document(id!).setData( [
                   "first_name": f_name,
                   "last_name": l_name,
                   "role": _role
               ]) { err in
                   if let err = err {
                       print("Error adding document: \(err)")
                   } else {
                       print("Document added")
                   }
               }
               
               self.signupButton.isEnabled = true
               self.AccountButton.isEnabled = true
               
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "UpdateVC") as UIViewController
                self.navigationController?.pushViewController(vc, animated: true)

              
               
           }
           
         
    }
}
