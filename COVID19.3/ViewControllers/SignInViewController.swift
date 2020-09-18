//
//  SignInViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/14/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var S_EmailTextField: UITextField!
    @IBOutlet weak var S_PasswordTextField: UITextField!
    @IBOutlet weak var SigninButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var NeedAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    func setUpElement(){
        //hide the errorLabel
        ErrorLabel.alpha = 0
        
        //Utilities.styleTextField(S_EmailTextField)
        //Utilities.styleTextField(S_PasswordTextField)
        Utilities.styleFilledButton(SigninButton)
        Utilities.styleFilledButton(NeedAccountButton)
    }
   
    
    @IBAction func SigninTapped(_ sender: Any) {
        
        // Validate Text Fields
        if  S_EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            S_PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                   
            self.ErrorLabel.text = "Please fill all the fields."
            self.ErrorLabel.alpha = 1
               }
        
              // Create cleaned versions of the text field
              let email = S_EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              let password = S_PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
              
              // Signing in the user
              Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                  
                  if error != nil {
                      // Couldn't sign in
                      self.ErrorLabel.text = error!.localizedDescription
                      self.ErrorLabel.alpha = 1
                  }
                  else {
                      
                      let FirstViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.FirstViewController) as? FirstViewController
                      self.view.window?.rootViewController = FirstViewController
                      self.view.window?.makeKeyAndVisible()
                  }
            }
        }
    
    }
      

