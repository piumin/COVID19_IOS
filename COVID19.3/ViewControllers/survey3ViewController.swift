//
//  survey3ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class survey3ViewController: UIViewController {
    
    @IBOutlet weak var survey3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    

    func setUpElement(){
      
        Utilities.styleLabel(survey3Label)
     
    }

    @IBAction func survey3ButtonYesTapped(_ sender: Any) {
        
        survey3Label.text = "Yes"
    }
    
    @IBAction func survey3ButtonNoTapped(_ sender: Any) {
        
        survey3Label.text = "Nope"
    }
    
}
