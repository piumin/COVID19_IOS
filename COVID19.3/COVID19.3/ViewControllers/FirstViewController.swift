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
        
        notifyUIView.layer.cornerRadius = 8.0
        notifyUIView.layer.shadowRadius = 10.0
        notifyUIView.layer.shadowColor = UIColor.gray.cgColor
        notifyUIView.layer.shadowOffset = .zero
        
        SurveyLabel.layer.cornerRadius = 8.0
        SurveyLabel.layer.shadowRadius = 10.0
        SurveyLabel.layer.shadowColor = UIColor.gray.cgColor
        SurveyLabel.layer.shadowOffset = .zero
        
        UpdateUIView.layer.cornerRadius = 8.0
        UpdateUIView.layer.shadowRadius = 10.0
        UpdateUIView.layer.shadowColor = UIColor.gray.cgColor
        UpdateUIView.layer.shadowOffset = .zero
        
        UpdateButton.layer.cornerRadius = 8.0
        UpdateButton.layer.borderColor = UIColor.black.cgColor
        UpdateButton.layer.borderWidth = 2
        UpdateButton.tintColor = UIColor.black
        
        tempTextField.layer.borderWidth = 2
        tempTextField.layer.borderColor = UIColor.gray.cgColor
        tempTextField.layer.cornerRadius = 8.0
        
     
        
    }
   
}



