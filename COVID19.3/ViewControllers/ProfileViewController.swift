//
//  ProfileViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

@IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var ProfileUpdateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    
    func setUpElement(){
      
        Utilities.roundImageView(cameraImageView)
        Utilities.updateButton(ProfileUpdateButton)
     
    }

}
