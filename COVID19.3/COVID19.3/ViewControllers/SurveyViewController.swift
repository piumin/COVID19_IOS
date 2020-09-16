//
//  SurveyViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
@IBOutlet weak var survey1TextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
                setUpElement()
    }
      func setUpElement(){
        
          Utilities.styleTextField(survey1TextField)
       // Utilities.styleTextField(survey2TextField)
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
