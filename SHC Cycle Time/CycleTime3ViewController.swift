//
//  CycleTime3ViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/18/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class CycleTime3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showComponentCollectionInfo()
    }
    
    func showComponentCollectionInfo() {
        let numberOfComponentCollections = componentCollections.count
        
        if (numberOfComponentCollections > 0) {
            var i = 0
            while (i<componentCollections[numberOfComponentCollections-1].count) {
                
                componentsLabel.text?.append(String(i+1) + ". " + componentCollections[numberOfComponentCollections-1][i] + "\n")
                
                i = i+1
            }
            
        }
    }
    @IBOutlet weak var componentsLabel: UILabel!
    
}
