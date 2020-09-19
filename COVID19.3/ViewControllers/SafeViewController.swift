//
//  SafeViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/18/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class SafeViewController: UIViewController {

    
    @IBOutlet weak var SafeView: UIView!
    @IBOutlet weak var SafeCloseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
       }
       
       func setUpElement(){
         
        Utilities.styleFilledView(SafeView)
        Utilities.updateButton(SafeCloseButton)
           
       }
}
