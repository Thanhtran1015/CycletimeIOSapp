//
//  UserCollection.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-03-27.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

//var userCollection = [User]()

//var adminCollection = [Admin(name: "PETER", password: "p"), Admin(name: "SWOOK", password: "s")]

//var userIdArray = [0]

var currentUser = User(id:0,name:"",password:"",office:"",roleId:0,role:"")

var currentAdmin = Admin(name:"",password:"")

var currentToken = Token(title: "", content: "")

var userCollectionFromUrl = [User]()

var cycleTimeTableFromUrl = [CycleTime]()

//var realTimeCycleTimeCollection = [TripleDataCycleTime(id: 0, current: 0.0, average: 0.0),TripleDataCycleTime(id: 0, current: 0.0, average: 0.0),TripleDataCycleTime(id: 0, current: 0.0, average: 0.0),TripleDataCycleTime(id: 0, current: 0.0, average: 0.0),TripleDataCycleTime(id: 0, current: 0.0, average: 0.0)]

//var currentAverageCycleTime = 0.0

var buildingsList = [Building]()

var cellsListOfCurrentBuilding = [Cell]()

var stationsListOfCurrentCell = [String]()

var currentBuilding = ""

var currentCell = ""

var currentStation = ""

var realTimeCycleTimeCollection = [TripleDataCycleTime]()

var maxCycleTimeCollection = [MaxCycleTime]()


var temp = realTimeCycleTimeCollection.count

var serverDateTimeString = ""

var dataCollection = [Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: ""),Data(a: "", s: "", e: "", d: 0.0, sq: 0, c: "")]

var cycleTime = CycleTime(id: 0, operationId: "", operationName: "", standardCT: 0.0, cTCollection: dataCollection, averageCT: 0.0, bestCT: 0.0, availability: 0.0, lastH: 0, lastM: 0, lastS: 0, serverDateTime: "", onGoingTime: 0, from0730ToNow: 0, totalTime: 0)

var workers = [Worker]()
var machines = [Machine]()
var componentCollections = [[String]]()
var analysis = Analysis(edo: 0, ebdo: 0, edb: 0, dobn: 0, eho: 0, ebho: 0, ehb: 0, hobn: 0)

var localStandardCT = 0.0


//let urlUser = URL(string: "https://5cb52eba07f233001424cdb5.mockapi.io/Login")!
let urlUser = URL(string: "http://10.4.5.61:8044/api/accounts")!
let urlTime = URL(string: "http://10.4.5.61:8044/api/arduinoes")!
let urlMax = URL(string: "http://10.4.5.61:8044/api/maxcycletime")!

let urlBuildingsList = URL(string: "http://10.4.5.61:8044/api/?????")!
let urlCellsList = URL(string: "http://10.4.5.61:8044/api/?????")!
let urlStationsList = URL(string: "http://10.4.5.61:8044/api/?????")!

let urlServerDateTime = URL(string:"http://10.4.0.57:1904/datetime")!
let urlCycleTimes = URL(string:"http://10.4.0.57:1904/api/cycletimes")!
let urlWorkers = URL(string:"http://10.4.0.57:1904/api/workers")!
let urlMachines = URL(string:"http://10.4.0.57:1904/api/machines")!
let urlComponentCollections = URL(string:"http://10.4.0.57:1904/api/componentCollections")!
let urlAnalysis = URL(string:"http://10.4.0.57:1904/api/analysis")!
