//
//  SafeAciton2ViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/16/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class SafeAciton2ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageController2: UIPageControl!
    @IBOutlet weak var ScrollViewSafeAction2: UIScrollView!
    
    var contentWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScrollViewSafeAction2.delegate = self
        
        for image in 0...5{
            let imageDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageDisplay)
            
            ScrollViewSafeAction2.addSubview(imageView)
            
            let  xCoordinate = view.frame.minX + view.frame.width * CGFloat(image)
            
            ScrollViewSafeAction2.addSubview(imageView)
            
            contentWidth += view.frame.width
            imageView.frame = CGRect(x: xCoordinate, y: (view.frame.height/300), width: 385, height: 750)
        }
        
        ScrollViewSafeAction2.contentSize = CGSize(width: contentWidth, height: view.frame.height/2)
    }
    
func scrollViewDidScroll(_ scrollView: UIScrollView) {
    pageController2.currentPage = Int(ScrollViewSafeAction2.contentOffset.x/CGFloat(414))}
}
