//
//  WarningViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/18/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class WarningViewController: UIViewController {

    @IBOutlet weak var WarningView: UIView!
    @IBOutlet weak var warningCloseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    
    func setUpElement(){
      
        Utilities.styleFilledView(WarningView)
        Utilities.updateButton(warningCloseButton)
        
    }

}
