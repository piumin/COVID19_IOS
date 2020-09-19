//
//  Utilities.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/14/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        // Remove border on text field
        textfield.borderStyle = .none
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    static func styleLabel(_ label:UILabel) {
          
          // Create the bottom line
          let bottomLine = CALayer()
          bottomLine.frame = CGRect(x: 0, y: label.frame.height - 2, width: label.frame.width, height: 2)
          bottomLine.backgroundColor = UIColor.gray.cgColor
          // Add the line to the label
          label.layer.addSublayer(bottomLine)
          
      }
    
    static func styleFilledButton(_ button:UIButton) {
        
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
      static func styleHomeTextField(_ textHome:UITextField) {
            
        textHome.layer.borderWidth = 2
        textHome.layer.borderColor = UIColor.gray.cgColor
        textHome.layer.cornerRadius = 8.0
    }
    
     static func mapButton(_ button:UIButton) {
            
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor.white
        }
    static func updateButton(_ buttonupdate:UIButton) {
               
        buttonupdate.layer.cornerRadius = 8.0
        buttonupdate.layer.borderColor = UIColor.black.cgColor
        buttonupdate.layer.borderWidth = 2
        buttonupdate.tintColor = UIColor.black
           }

    static func styleFilledView(_ label:UIView) {
        
        label.layer.cornerRadius = 8.0
        label.layer.shadowRadius = 10.0
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = .zero
        
        }
    
static func roundImageView(_ imageView:UIImageView) {
    
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
}
    
}
