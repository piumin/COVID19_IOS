//
//  SignInViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/14/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import Firebase
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
    
override func viewWillAppear(_ animated: Bool){
     if(UserDefaults.standard.bool(forKey: "is_logged")) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "UpdateVC") as UIViewController
         self.navigationController?.pushViewController(vc, animated: true)
     }
 }
    
    func setUpElement(){
        
        Utilities.styleFilledButton(SigninButton)
        Utilities.styleFilledButton(NeedAccountButton)
    }
    
    @IBAction func SigninTapped(_ sender: Any) {
        
        ErrorLabel.isHidden = true
        
        let _email = S_EmailTextField.text!
        let _password = S_PasswordTextField.text!
        
        if(_email.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            _password.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            ErrorLabel.text = "Please fill all fields"
            ErrorLabel.isHidden = false
        }
        
        SigninButton.isEnabled = false
        NeedAccountButton.isEnabled = false
        
        Auth.auth().signIn(withEmail: _email, password: _password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if(error != nil){
                self?.ErrorLabel.text = "Invalid E-Mail or Password"
                self?.ErrorLabel.isHidden = false
                self?.SigninButton.isEnabled = true
                self?.NeedAccountButton.isEnabled = true
                return
            }
            
          let id = authResult?.user.uid
            
          UserDefaults.standard.set(id!, forKey: "id")
          UserDefaults.standard.set(_email, forKey: "email")
          UserDefaults.standard.set(_password, forKey: "password")
          UserDefaults.standard.set(true, forKey: "is_logged")
            
            self?.SigninButton.isEnabled = true
            self?.NeedAccountButton.isEnabled = true
            
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UpdateVC") as UIViewController
        self?.navigationController?.pushViewController(vc, animated: true)
                    
                }
        }
    
    }
      

