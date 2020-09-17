//
//  FirstViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/12/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var notifyUIView: UIView!
    @IBOutlet weak var SurveyLabel: UIView!    
    @IBOutlet weak var UpdateUIView: UIView!
    @IBOutlet weak var UpdateButton: UIButton!
    @IBOutlet weak var tempTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElement()
        
    }
   
    func setUpElement(){
         
        Utilities.styleFilledView(notifyUIView)
        Utilities.styleFilledView(UpdateUIView)
        Utilities.styleFilledView(SurveyLabel)
        Utilities.styleFilledView(tempTextField)
        Utilities.styleFilledView(UpdateButton)
        
     }
}



