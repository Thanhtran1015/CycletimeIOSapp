//
//  CycleTimeViewController.swift
//  SHC Cycle Time
//
//  Created by Mac Project PC on 2019-04-21.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit

class CycleTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        helloLabel.text = "Hello " + currentUser.name + "!"
        
        
        
//        GetMonoRealAndAverageCycleTimeFromUrl(url: urlTime)
//        realTimeCycleTimeLabel.text = String(currentRealTimeCycleTime)
//        averageCycleTimeLabel.text = String(currentAverageCycleTime)
        
//        var timerUrl = Timer()
//        timerUrl = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("RefreshRealAndAverageCycleTimeEverySecond"), userInfo: nil, repeats: true)
        //timerUrl.invalidate()
        
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(RefreshRealAndAverageCycleTimeEverySecond), userInfo: nil, repeats: true)
    }
    
    @objc func RefreshRealAndAverageCycleTimeEverySecond() {
        //GetMonoRealAndAverageCycleTimeFromUrl(url: urlTime)
       // GetMaxCycleTimeFromUrl(url: urlMax)

       
        let numberOfValues = realTimeCycleTimeCollection.count
        let numberOfMaxCycleTime = maxCycleTimeCollection.count

        var maxCycleTime: Double
        var average :Double
        
        var current1 :Double
        var current2 :Double
        var current3 :Double
        var current4 :Double
        var current5 :Double
        
        if (numberOfMaxCycleTime > 0) {
            maxCycleTime = maxCycleTimeCollection[0].value
        } else {
            maxCycleTime = 0.0
        }
        
        if (numberOfValues > 0) {
            average = realTimeCycleTimeCollection[numberOfValues - 1].average
        } else {
            average = 0.0
        }
        
        if (numberOfValues > 0) {
            current1 = realTimeCycleTimeCollection[numberOfValues - 1].current
        } else {
            current1 = 0.0
        }
        if (numberOfValues > 1) {
            current2 = realTimeCycleTimeCollection[numberOfValues - 2].current
        } else {
            current2 = 0.0
        }
        if (numberOfValues > 2) {
            current3 = realTimeCycleTimeCollection[numberOfValues - 3].current
        } else {
            current3 = 0.0
        }
        if (numberOfValues > 3) {
            current4 = realTimeCycleTimeCollection[numberOfValues - 4].current
        } else {
            current4 = 0.0
        }
        if (numberOfValues > 4) {
            current5 = realTimeCycleTimeCollection[numberOfValues - 5].current
        } else {
            current5 = 0.0
        }
        
        /////
        
        
            
            if (current1 == 0.0) {
                bigLabel.textColor = UIColor.lightGray
            }
            else {
                if (current1 > maxCycleTime) {
                    bigLabel.textColor = UIColor.red
                }
                else {
                    bigLabel.textColor = UIColor.blue
                }
            }
            
            if (average == 0.0) {
                averageCycleTimeLabel.textColor = UIColor.lightGray
            }
            else {
                
                if (average > maxCycleTime) {
                    averageCycleTimeLabel.textColor = UIColor.red
                }
                else {
                    averageCycleTimeLabel.textColor = UIColor.blue
                }
                
            }
        
        maxCycleTimeLabel.text = String(maxCycleTime)
        averageCycleTimeLabel.text = String(average)
        bigLabel.text = String(current1)
        realTimeCycleTimeLabel.text = ""
        //realTimeCycleTimeLabel.text = String(current2) + "\n" + String(current3) + "\n" + String(current4) + "\n" + String(current5)
        
    }
    
    @objc func RefreshTimeLabelsEverySecond() {
//        realTimeCycleTimeLabel.text = String(currentRealTimeCycleTime)
//        averageCycleTimeLabel.text = String(currentAverageCycleTime)
//        print(currentRealTimeCycleTime)
//        print(currentAverageCycleTime)
    }
    
    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var maxCycleTimeLabel: UILabel!
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var realTimeCycleTimeLabel: UILabel!
    
    @IBOutlet weak var averageCycleTimeLabel: UILabel!
    
}

