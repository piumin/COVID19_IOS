//
//  Survey2ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class Survey2ViewController: UIViewController {

    @IBOutlet weak var survey2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    

    func setUpElement(){
      
        Utilities.styleLabel(survey2Label)
        
    }

    
    @IBAction func survey2ButtonYesTapped(_ sender: Any) {
        survey2Label.text = "Yes"
    }
    
    @IBAction func survey2ButtonnoTapped(_ sender: Any) {
        survey2Label.text = "Nope"
    }
}
