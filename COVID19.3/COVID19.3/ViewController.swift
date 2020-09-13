//
//  ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/12/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vwContainerhome1:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vwContainerhome1.layer.cornerRadius = 10.0
        vwContainerhome1.layer.shadowColor = UIColor.gray.cgColor
        vwContainerhome1.layer.shadowOffset = .zero
        vwContainerhome1.layer.shadowOpacity = 0.8
        vwContainerhome1.layer.shadowRadius = 10.0
        vwContainerhome1.layer.shadowPath = UIBezierPath(rect: vwContainerhome1.bounds).cgPath
        vwContainerhome1.layer.shouldRasterize = true
            }
    

}
