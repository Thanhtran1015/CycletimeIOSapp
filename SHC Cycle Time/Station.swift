//
//  Station.swift
//  SHC Cycle Time
//
//  Created by Mac Project PC on 2019-05-17.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class Station {
    
    var name:String
    var realCycleTime:String
    var standardCycleTime:String
    var averageCycleTime:String
    var status:String
    
    init(name:String,realCycleTime:String,standardCycleTime:String,averageCycleTime:String,status:String) {
        self.name = name
        self.realCycleTime = realCycleTime
        self.standardCycleTime = standardCycleTime
        self.averageCycleTime = averageCycleTime
        self.status = status
    }
}
