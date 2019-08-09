//
//  TripleDataCycleTime.swift
//  SHC Cycle Time
//
//  Created by Mac Project PC on 2019-04-24.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class TripleDataCycleTime {
    
    var id:Int
    var current:Double
    var average:Double
    
    init(id:Int,current:Double,average:Double) {
        self.id = id
        self.current = current
        self.average = average
    }
}
