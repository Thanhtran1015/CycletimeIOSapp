//
//  Worker.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/21/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class Machine {
    
    var machineId:Int
    var machineName:String
    var modelNo:String
    var line:String
    
    init(machineId:Int,machineName:String,modelNo:String,line:String) {
        self.machineId = machineId
        self.machineName = machineName
        self.modelNo = modelNo
        self.line = line
    }
}
