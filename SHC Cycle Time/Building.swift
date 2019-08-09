//
//  Building.swift
//  SHC Cycle Time
//
//  Created by Mac Project PC on 2019-05-17.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class Building {
    
    var name:String
    var status:String
    var totalOvertime:Int
    
    init(name:String,status:String,totalOvertime:Int) {
        self.name = name
        self.status = status
        self.totalOvertime = totalOvertime
    }
}
