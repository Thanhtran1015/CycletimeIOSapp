//
//  Worker.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/21/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class Worker {
    
    var workerId:Int
    var workerName:String
    var leaderId:Int
    var leaderName:String
    
    init(workerId:Int,workerName:String,leaderId:Int,leaderName:String) {
        self.workerId = workerId
        self.workerName = workerName
        self.leaderId = leaderId
        self.leaderName = leaderName
    }
}
