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
        //hide the errorLabel
       S_ErrorLabel.alpha = 0
        
        
        Utilities.styleFilledButton(signupButton)
        Utilities.styleFilledButton(AccountButton)
    }
   
/*check th fields and validate to check if the data is correct. if correct
    will return nil or else will return the error message
*/
    func validateFields() -> String? {
        
        //check if all the fields are filled
        if FnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill all the fields."
        }
        //check if the password is secured
        
        let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password is not secure enough
            return "Please make sure your Password is at least 8 characters, contains a special character and number"
        }
        
        return nil
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        
        //validte the fields
        
        let error = validateFields()
        if error != nil{
            //there is something wrong with the fields,show error message
            showError((error!))
        }
        else{
            //create the clean version of the data
             let fname = FnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let lname = LnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let role = RoleTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //create the user
        
            Auth.auth().createUser(withEmail: email, password: password){(Result,err) in
                //check for errors
                if err != nil {
                    //there was a error creating the user
                    self.showError("Error creating user")
                }
                else{
                    //user was created succesfully,now store the first name and the last name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["fname" : fname, "lname" : lname, "role" :role, "uid" : Result!.user.uid]) {(error) in
                        
                        if error != nil{
                            //show error message
                            self.showError("Error saving User data")
                        }
                    }
                    //transition to the update screen
                        self.transitionUpdate()
                }
            }
            
        
        }
    }
    
    func showError(_ message:String) {
        S_ErrorLabel.text = message
        S_ErrorLabel.alpha = 1
    }
   
    func transitionUpdate() {
        let FirstViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.FirstViewController) as? FirstViewController
        view.window?.rootViewController = FirstViewController
        view.window?.makeKeyAndVisible()
        
    }
}
