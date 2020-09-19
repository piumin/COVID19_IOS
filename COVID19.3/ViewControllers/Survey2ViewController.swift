//
//  Survey2ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseFirestore

class Survey2ViewController: UIViewController {

    @IBOutlet weak var Survey2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElement()
    }

    func setUpElement(){
      
        Utilities.styleLabel(Survey2Label)
    }

    @IBAction func survey2ButtonYesTapped(_ sender: Any) {
        Survey2Label.text = "Yes"
         que2 = true
    }
    
    @IBAction func survey2ButtonnoTapped(_ sender: Any) {
        Survey2Label.text = "Nope"
        que2 = false
    }
}
