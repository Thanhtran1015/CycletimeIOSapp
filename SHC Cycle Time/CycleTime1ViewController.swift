//
//  CycleTime2ViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/18/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit
import QuartzCore

class CycleTime1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMachineInfo()
        showWorkerInfo()
        
    }
    
    func showWorkerInfo() {
        
        //getCurrentDateTime()
        
        
        let numberOfWorkers = workers.count
        
        var workerId: Int
        var workerName :String
        var leaderId: Int
        var leaderName :String
        
        
        if (numberOfWorkers > 0) {
            workerId = workers[numberOfWorkers-1].workerId
            workerName = workers[numberOfWorkers-1].workerName
            leaderId = workers[numberOfWorkers-1].leaderId
            leaderName = workers[numberOfWorkers-1].leaderName
            
            workerInfoLabel.text = "Worker ID: " + String(workerId) + "\nWorker name: " + workerName + "\nLeader ID: " + String(leaderId) + "\nLeader name: " + leaderName
            
        }
    }
    
    func showMachineInfo() {
        
        //getCurrentDateTime()
        
        
        let numberOfMachines = machines.count
        
        var machineId: Int
        var machineName :String
        var modelNo: String
        var line :String
        
        
        if (numberOfMachines > 0) {
            machineId = machines[numberOfMachines-1].machineId
            machineName = machines[numberOfMachines-1].machineName
            modelNo = machines[numberOfMachines-1].modelNo
            line = machines[numberOfMachines-1].line
            
            machineInfoLabel.text = "Machine ID: " + String(machineId) + "\nMachine name: " + machineName + "\nModel no: " + modelNo + "\nLine: " + line
            
        }
    }
    
    //    func getCurrentDateTime() {
    //        let formatter = DateFormatter()
    //        formatter.dateFormat = "EEE, MMM/dd/yyyy HH:mm:ss a"
    //        let dateTimeString = formatter.string(from: Date())
    //        dateTimeLabel.text = dateTimeString
    //    }
    
    @IBOutlet weak var machineInfoLabel: UILabel!
    
    @IBOutlet weak var workerInfoLabel: UILabel!
}
