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
    @IBOutlet weak var vwContainerhome2:UIView!
    @IBOutlet weak var vwContainerhome3:UIView!
    @IBOutlet weak var vwContainerhome4:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vwContainerhome1.layer.cornerRadius = 10.0
        vwContainerhome1.layer.shadowColor = UIColor.gray.cgColor
        vwContainerhome1.layer.shadowOffset = .zero
        vwContainerhome1.layer.shadowOpacity = 0.8
        vwContainerhome1.layer.shadowRadius = 10.0
        vwContainerhome1.layer.shadowPath = UIBezierPath(rect: vwContainerhome1.bounds).cgPath
        vwContainerhome1.layer.shouldRasterize = true
        
        vwContainerhome2.layer.cornerRadius = 10.0
        vwContainerhome2.layer.shadowColor = UIColor.gray.cgColor
        vwContainerhome2.layer.shadowOffset = .zero
        vwContainerhome2.layer.shadowOpacity = 0.8
        vwContainerhome2.layer.shadowRadius = 10.0
        vwContainerhome2.layer.shadowPath = UIBezierPath(rect: vwContainerhome2.bounds).cgPath
        vwContainerhome2.layer.shouldRasterize = true
        
        vwContainerhome3.layer.cornerRadius = 10.0
        vwContainerhome3.layer.shadowColor = UIColor.gray.cgColor
        vwContainerhome3.layer.shadowOffset = .zero
        vwContainerhome3.layer.shadowOpacity = 0.8
        vwContainerhome3.layer.shadowRadius = 10.0
        vwContainerhome3.layer.shadowPath = UIBezierPath(rect: vwContainerhome3.bounds).cgPath
        vwContainerhome3.layer.shouldRasterize = true
        
        vwContainerhome4.layer.cornerRadius = 10.0
        vwContainerhome4.layer.shadowColor = UIColor.gray.cgColor
        vwContainerhome4.layer.shadowOffset = .zero
        vwContainerhome4.layer.shadowOpacity = 0.8
        vwContainerhome4.layer.shadowRadius = 10.0
        vwContainerhome4.layer.shadowPath = UIBezierPath(rect: vwContainerhome4.bounds).cgPath
        vwContainerhome4.layer.shouldRasterize = true
            }
    

}
