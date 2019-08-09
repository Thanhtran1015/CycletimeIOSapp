//
//  CycleTime.swift
//  SHC Cycle Time
//
//  Created by Mac Project PC on 2019-04-21.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class CycleTime {
    
    var id:Int
    var operationId:String
    var operationName:String
    var standardCT:Double
    var cTCollection:[Data]
    var averageCT:Double
    var bestCT:Double
    var availability:Double
    var lastH:Int
    var lastM:Int
    var lastS:Int
    var serverDateTime:String
    var onGoingTime:Int
    var from0730ToNow: Int
    var totalTime:Int
    init(id:Int,operationId:String,operationName:String,standardCT:Double,cTCollection:[Data],averageCT:Double,bestCT:Double,availability:Double,lastH:Int,lastM:Int,lastS:Int,serverDateTime:String,onGoingTime:Int,from0730ToNow:Int,totalTime:Int) {
        self.id = id
        self.operationId = operationId
        self.operationName = operationName
        self.standardCT = standardCT
        self.cTCollection = cTCollection
        self.averageCT = averageCT
        self.bestCT = bestCT
        self.availability = availability
        self.lastH = lastH
        self.lastM = lastM
        self.lastS = lastS
        self.serverDateTime = serverDateTime
        self.onGoingTime = onGoingTime
        self.from0730ToNow = from0730ToNow
        self.totalTime = totalTime
    }
}
