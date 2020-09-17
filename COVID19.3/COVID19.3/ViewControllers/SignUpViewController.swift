//
//  SignUpViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/14/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

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
   
    // MARK: - Navigation

    
    @IBAction func signupTapped(_ sender: Any) {
    }
    
}
