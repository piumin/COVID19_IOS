//
//  survey3ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit
import FirebaseFirestore

class survey3ViewController: UIViewController {
    
    @IBOutlet weak var Survey3Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }

    func setUpElement(){
      
        Utilities.styleLabel(Survey3Label)
     
    }

    @IBAction func survey3ButtonYesTapped(_ sender: Any) {
        
        Survey3Label.text = "Yes"
        que3 = true
    }
    
    @IBAction func survey3ButtonNoTapped(_ sender: Any) {
        
        Survey3Label.text = "Nope"
        que3 = false
    }
}
