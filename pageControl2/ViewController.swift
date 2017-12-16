//
//  ViewController.swift
//  pageControl2
//
//  Created by SO YOUNG on 2017. 12. 16..
//  Copyright © 2017년 SO YOUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView_flowers: UIScrollView!
    
    
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl = UIPageControl(frame: CGRect(x: 0, y: view.frame.height - 37, width: view.frame.width, height: 37))
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        
        
        /// event 넘겨주는 것 !!!!!!!
        pageControl.addTarget(self, action: #selector(flowersPAgeChanged(sender:)), for: .valueChanged)
        scrollView_flowers.delegate = self
        
        view.addSubview(pageControl)
        let scrollWidth = scrollView_flowers.frame.width
        let scrollHeight = scrollView_flowers.frame.height
        
        scrollView_flowers.contentSize = CGSize(width: scrollWidth * 6, height: scrollHeight)
        
        for i in 0...5 {
            let imageView = UIImageView(frame: CGRect(x: scrollWidth * CGFloat(i), y: 0, width: scrollWidth, height: scrollHeight))
            imageView.image = UIImage(named: String(format: "%02d", i + 1))
            scrollView_flowers.addSubview(imageView)
        }
        
        
    }
    
    @objc func flowersPAgeChanged(sender: UIPageControl){
        scrollView_flowers.contentOffset.x = view.frame.width * CGFloat(sender.currentPage)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.frame.width)
    }
}

