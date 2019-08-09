//
//  CycleTime.swift
//  SHC Cycle Time
//
//  Created by Mac Project PC on 2019-04-21.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class Analysis {
    
    var edo :Int
    var ebdo :Int
    var edb :Int
    var dobn :Int
    var eho :Int
    var ebho :Int
    var ehb :Int
    var hobn :Int
    init(edo :Int, ebdo :Int, edb :Int, dobn :Int, eho :Int, ebho :Int, ehb :Int, hobn :Int) {
        self.edo = edo
        self.ebdo = ebdo
        self.edb = edb
        self.dobn = dobn
        self.eho = eho
        self.ebho = ebho
        self.ehb = ehb
        self.hobn = hobn
    }
}
