//
//  CycleTime2ViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/18/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit
import QuartzCore

class CycleTime2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        standardCTLabel.layer.masksToBounds = true
        standardCTLabel.layer.cornerRadius = 5
        
        avgCTLabel.layer.masksToBounds = true
        avgCTLabel.layer.cornerRadius = 5
        
        realCTLabel.layer.masksToBounds = true
        realCTLabel.layer.cornerRadius = 5
        
        finishedTimeLabel.layer.masksToBounds = true
        finishedTimeLabel.layer.cornerRadius = 5
        
        editStandardButton.layer.masksToBounds = true
        editStandardButton.layer.cornerRadius = 5
        
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(RefreshRealAndAverageCycleTimeEverySecond), userInfo: nil, repeats: true)
    }
    
    @objc func RefreshRealAndAverageCycleTimeEverySecond() {
        
        getCurrentDateTime()
        GetCycleTimesFromUrl(url: urlCycleTimes)
        
        var id: Int
        var operationId :String
        var operationName :String
        var standardCT :Double
        var realCT10 :Double
        var averageCT: Double
        var bestCT: Double
        var availability: Double
        var finishedTime: String
        var onGoingTime: Int
        
        id = cycleTime.id
        operationId = cycleTime.operationId
        operationName = cycleTime.operationName
        standardCT = cycleTime.standardCT
        realCT10 = cycleTime.cTCollection[9].d
        averageCT = cycleTime.averageCT
        bestCT = cycleTime.bestCT
        availability = cycleTime.availability
        finishedTime = cycleTime.cTCollection[9].c
        onGoingTime = cycleTime.onGoingTime
        
        if (realCT10 > standardCT) {
            realCTLabel.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.3607843137, blue: 0.3607843137, alpha: 1)
            finishedTimeLabel.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.3607843137, blue: 0.3607843137, alpha: 1)
        }
        else {
            realCTLabel.backgroundColor = #colorLiteral(red: 0.3607843137, green: 0.7215686275, blue: 0.3607843137, alpha: 1)
            finishedTimeLabel.backgroundColor = #colorLiteral(red: 0.3607843137, green: 0.7215686275, blue: 0.3607843137, alpha: 1)
        }
        
        if (averageCT > standardCT) {
            avgCTLabel.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.3607843137, blue: 0.3607843137, alpha: 1)
        }
        else {
            avgCTLabel.backgroundColor = #colorLiteral(red: 0.3607843137, green: 0.7215686275, blue: 0.3607843137, alpha: 1)
        }
        
        if (onGoingTime > 60) {
            onGoingTimeLabel.textColor = UIColor.red
        }
        
        else {
            onGoingTimeLabel.textColor = UIColor.white
        }
        
        operationInfoLabel.text = "ID: " + String(id) + "\nOperation ID: " + operationId + "\nOperation name: " + operationName
        
        standardCTLabel.text = "Standard CT: " + String(standardCT);
        
        avgCTLabel.text = "AVG CT: " + String(averageCT);
        
        bestCTLabel.text = "Best CT: " + String(bestCT);
        
        realCTLabel.text = "Last CT: " + String(realCT10);
        
        finishedTimeLabel.text = "Since: " + String(finishedTime);
        
        availabilityLabel.text = "Availability: " + String(availability) + "%"
        
        onGoingTimeLabel.text = "Ongoing: " + String(onGoingTime)
        
    }
    
    func getCurrentDateTime() {
        dateTimeLabel.text = cycleTime.serverDateTime
    }
    
    func updateNewStandard() {
        
    }
    @IBAction func editStandartTouched(_ sender: Any) {
        let popUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditingStandardStoryBoard") as! EditingStandardViewController
        self.addChild(popUpViewController)
        popUpViewController.view.frame = self.view.frame
        self.view.addSubview(popUpViewController.view)
        popUpViewController.didMove(toParent: self)
    }
    @IBAction func explainButtonTouched(_ sender: Any) {
        let popUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InformationPopUpStoryBoard") as! InformationPopUpViewController
        self.addChild(popUpViewController)
        popUpViewController.view.frame = self.view.frame
        self.view.addSubview(popUpViewController.view)
        popUpViewController.didMove(toParent: self)
    }
    
    @IBOutlet weak var explainButton: UIButton!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var operationInfoLabel: UILabel!
    
    @IBOutlet weak var standardCTLabel: UILabel!
    
    @IBOutlet weak var avgCTLabel: UILabel!
    
    @IBOutlet weak var bestCTLabel: UILabel!
    
    @IBOutlet weak var realCTLabel: UILabel!
    
    @IBOutlet weak var availabilityLabel: UILabel!
    
    @IBOutlet weak var finishedTimeLabel: UILabel!
    
    @IBOutlet weak var onGoingTimeLabel: UILabel!
    @IBOutlet weak var editStandardButton: UIButton!
        @IBAction func availabilityLongPress(_ sender: UILongPressGestureRecognizer) {
    
            let popUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InformationPopUpStoryBoard") as! InformationPopUpViewController
                        self.addChild(popUpViewController)
                        popUpViewController.view.frame = self.view.frame
                        self.view.addSubview(popUpViewController.view)
                        popUpViewController.didMove(toParent: self)
    
        }
}
