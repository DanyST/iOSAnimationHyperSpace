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
        
        view.addGestureRecognizer(tapGestureRecornizer)
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
    }
}

