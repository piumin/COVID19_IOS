//
//  SurveyViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var SurveyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                setUpElement()
    }
      func setUpElement(){
        
        Utilities.styleLabel(SurveyLabel)
      }
    
    @IBAction func SurveyYesButton(_ sender: Any) {
         
        SurveyLabel.text = "Yes"
    }
    
    
    @IBAction func surveyNoButtonTapped(_ sender: Any) {
        SurveyLabel.text = "Nope"
    }
}
