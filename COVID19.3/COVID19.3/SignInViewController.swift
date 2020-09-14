//
//  SignInViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/14/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var S_EmailTextField: UITextField!
    @IBOutlet weak var S_PasswordTextField: UITextField!
    @IBOutlet weak var SigninButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    func setUpElement(){
        //hide the errorLabel
        ErrorLabel.alpha = 0
        
        Utilities.styleTextField(S_EmailTextField)
        Utilities.styleTextField(S_PasswordTextField)
        Utilities.styleFilledButton(SigninButton)
    }
    
    @IBAction func SigninTapped(_ sender: Any) {
    }
    
// MARK: - Signin

}
