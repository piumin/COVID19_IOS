//
//  survey4ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class survey4ViewController: UIViewController {
    @IBOutlet weak var survey4TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    

    func setUpElement(){
      
        Utilities.styleTextField(survey4TextField)
     
    }

}
