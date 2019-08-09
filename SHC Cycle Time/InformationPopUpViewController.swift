//
//  InformationPopUpViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/29/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class InformationPopUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        wholeView.layer.masksToBounds = true
        wholeView.layer.cornerRadius = 5
        closeButton.layer.masksToBounds = true
        closeButton.layer.cornerRadius = 5
        
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ShowInformation), userInfo: nil, repeats: true)
        
    }
    
    @objc func ShowInformation() {
        informationLabel.text = "= Total working time recorded (s) / Period time from 07:30:00 to now " + cycleTime.serverDateTime + " (s)\n= " + String(cycleTime.totalTime) + " (s) / " + String(cycleTime.from0730ToNow) + " (s)\n= " + String(cycleTime.availability) + " (%)"
    }
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var wholeView: UIView!
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}
