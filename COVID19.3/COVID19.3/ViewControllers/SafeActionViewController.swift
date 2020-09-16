//
//  SafeActionViewController.swift
//  COVID19.3
//
//  Created by Wickramasinghe PN on 9/15/20.
//  Copyright © 2020 Wickramasinghe PN. All rights reserved.
//

import UIKit

class SafeActionViewController: UIViewController {
    
        var pages : [SliderView] {
        get {
            
            let page1: SliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
            page1.SliderLabel1.text = "Corona Virus Prevention!"
            page1.SliderLabel2.text = "Follow these steps by yourself!"
            page1.ImageSlider.image = UIImage(named: "1")
            
            let page2: SliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
                page1.SliderLabel1.text = "Corona Virus Prevention!"
                page1.SliderLabel2.text = "Follow these steps by yourself!"
                page1.ImageSlider.image = UIImage(named: "2")
    
            let page3: SliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
                       page1.SliderLabel1.text = "Corona Virus Prevention!"
                       page1.SliderLabel2.text = "Follow these steps by yourself!"
                       page1.ImageSlider.image = UIImage(named: "3")
            
            let page4: SliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
                       page1.SliderLabel1.text = "Corona Virus Prevention!"
                       page1.SliderLabel2.text = "Follow these steps by yourself!"
                       page1.ImageSlider.image = UIImage(named: "4")
            
            let page5: SliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
                       page1.SliderLabel1.text = "Corona Virus Prevention!"
                       page1.SliderLabel2.text = "Follow these steps by yourself!"
                       page1.ImageSlider.image = UIImage(named: "5")
            let page6: SliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
                       page1.SliderLabel1.text = "Corona Virus Prevention!"
                       page1.SliderLabel2.text = "Follow these steps by yourself!"
                       page1.ImageSlider.image = UIImage(named: "6")
            
            return [page1, page2, page3, page4, page5, page6]
        }
    }
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderScrollView: UIScrollView!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            view.bringSubviewToFront(pageController)
            
            setupScrollView(pages: pages)
            
            pageController.numberOfPages = pages.count
            pageController.currentPage = 0
            
        }

            func setupScrollView(pages: [SliderView]) {
               sliderScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                sliderScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
                sliderScrollView.isPagingEnabled = true
                
                for i in 0 ..< pages.count {
                    pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                    sliderScrollView.addSubview(pages[i])
                }
            }
        
        }

    extension SafeActionViewController: UIScrollViewDelegate {
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageController.currentPage = Int(pageIndex)
        }
    }
