//
//  SurveyViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseFirestore

var que1 = false
var que2 = false
var que3 = false
var que4 = false

class SurveyViewController: UIViewController {

    @IBOutlet weak var Survey1Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
                setUpElement()
    }
      func setUpElement(){
        
        Utilities.styleLabel(Survey1Label)
      }
    
    @IBAction func SurveyYesButton(_ sender: Any) {
         
        Survey1Label.text = "Yes"
        que1 = true
    }
    
    @IBAction func surveyNoButtonTapped(_ sender: Any) {
        Survey1Label.text = "Nope"
        que1 = false
    }
}
