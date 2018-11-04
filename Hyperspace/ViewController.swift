//
//  ViewController.swift
//  Hyperspace
//
//  Created by Luis Herrera Lillo on 04-11-18.
//  Copyright © 2018 Luis Herrera Lillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark - Outlets
    @IBOutlet weak var enterpriseView: UIImageView!
    @IBOutlet var tapGestureRecornizer: UITapGestureRecognizer!
    
    // Mark - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create swipeGestureRecognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(jumpToHyperSpace))
        swipeGestureRecognizer.direction = .left
        
        // Add Gesture Recognizers
        view.addGestureRecognizer(tapGestureRecornizer)
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    
    // MARK: - IBActions
    @IBAction func userDidTap(_ sender: UITapGestureRecognizer) {
        let newCenter = tapGestureRecornizer.location(in: self.view)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseInOut, .beginFromCurrentState],
                       animations: {
                        self.enterpriseView.center = newCenter
                       },
                       completion: nil
        )
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseInOut, .beginFromCurrentState],
                       animations: {
                        self.enterpriseView.transform = CGAffineTransform(rotationAngle: CGFloat(M_2_PI))
        },
        completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [.curveEaseInOut, .beginFromCurrentState],
                           animations: {
                        self.enterpriseView.transform = CGAffineTransform.identity
            }, completion: nil)
        })
    }
    
    @objc func jumpToHyperSpace() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                        self.enterpriseView.center.x += 1000
                        self.enterpriseView.center.y += 50
        }, completion: nil)
    }
}

