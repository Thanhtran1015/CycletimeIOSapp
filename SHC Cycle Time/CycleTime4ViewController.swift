//
//  CycleTime4ViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/18/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class CycleTime4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showAnalysis), userInfo: nil, repeats: true)
        
    }
    
    @objc func showAnalysis() {
        getAnalysisDatasFromUrl(url: urlAnalysis)
        
        analysisLabel.text = "Estimate daily output: " + String(analysis.edo) + "\nEstimate best daily output: " + String(analysis.ebdo) + "\nEstimate daily balance: " + String(analysis.edb) + "\nDaily Output by now: " + String(analysis.dobn) + "\n\nEstimate hourly output: " + String(analysis.eho) + "\nEstimate best hourly output: " + String(analysis.ebho) + "\nEstimate hourly balance: " +
            String(analysis.ehb) + "\nHourly Output by now: " + String(analysis.hobn)
    }
    

    @IBOutlet weak var analysisLabel: UILabel!
}
