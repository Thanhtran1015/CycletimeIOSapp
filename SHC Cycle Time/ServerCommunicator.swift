//
//  ServerCommunicator.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-04-01.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation
//import Alamofire



//let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
//
//func PresentTheLoginPageAndStoreCredentials() {
//// Create an instance of the credentials manager for storing credential
//
//    Auth0
//
//        .webAuth()
//
//        .scope("openid profile offline_access")
//
//        .audience("https://dev-pp4-7wfz.auth0.com/userinfo")
//
//        .start {
//
//            switch $0 {
//            case .failure(let error):
//            // Handle the error
//                print("Error: \(error)")
//            case .success(let credentials):
//            // Auth0 will automatically dismiss the login page
//            // Store the credentials
//                credentialsManager.store(credentials: credentials)
//            }
//        }
//
//}
//
//
//func CheckForCredentialsWhenUserOpensAppAndSaveToLocal() {
//    guard credentialsManager.hasValid() else {
//        // No valid credentials exist, present the login page
//        PresentTheLoginPageAndStoreCredentials()
//        return
//    }
//
//    credentialsManager.credentials { error, credentials in
//        guard error == nil, let credentials = credentials else {
//            // Handle error
//            print("Error: \(error)")
//            return
//        }
//        // You now have a valid credentials object, you might want to store this locally for easy access.
//        // You will use this later to retrieve the user's profile
//    }
//
//    //When you need to log the user out, remove their credentials from the keychain:
//    credentialsManager.clear()
//
//}


//func loginAuth0() {
//    Auth0
//        .webAuth()
//        .scope("openid profile")
//        .audience("https://dev-pp4-7wfz.auth0.com/userinfo")
//        .start {
//            switch $0 {
//            case .failure(let error):
//                // Handle the error
//                print("Error: \(error)")
//            case .success(let credentials):
//                // Do something with credentials e.g.: save them.
//                // Auth0 will automatically dismiss the login page
//                print("Credentials: \(credentials)")
//                print("Login Successful")
//            }
//    }
//}

//let url1 = URL(string:"https://5c9ef054595c55001487bfb8.mockapi.io/users")!
//
//func getDataFromUrl(url:URL) -> NSData {
//
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//        if error != nil {
//            print (error!)
//        }
//        else {
//
////            print(data!)
//
//        }
//
//    }
//    task.resume()
//
//    let pulledData = task.value(forKey: "data") as! NSData
//
//    return(pulledData)
//}

//func getUserFromPulledDataFromUrl(data:NSData,id:Int) -> User {
//
//    do {
//    let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
//        print(jsonResult)
//        let user = (((jsonResult as? NSArray)?[id]) as! User)
//        return(user)
//
//    } catch {
//        print ("JSON processing failed")
//
//    }
//
//}

//func getUserNameTokenFromUser(user:User) -> String {
//
//    let userName = getUserFromPulledDataFromUrl(data: <#T##NSData#>, id: <#T##Int#>).name
//
//    print("name: \(userName)")
//
//    return userName
//}
//
//func getUserPasswordTokenFromUser(user:User) -> String {
//
//    let userPassword = getUserFromPulledDataFromUrl(data: <#T##NSData#>, id: <#T##Int#>).password
//
//    print("password: \(userPassword)")
//
//    return userPassword
//}


func GetUserCollectionFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    
                    let numberOfUser = (jsonResult as? NSArray)?.count
                    var i = 0
                    while (i < numberOfUser!) {
                        
                        if let user = (((jsonResult as? NSArray)?[i]) as? NSObject) {
                            
                            let id = ((user.value(forKey: "AccountID")) as! NSNumber).intValue
                            let name = (user.value(forKey: "Username")) as! String
                            let password = (user.value(forKey: "Password")) as! String
                            let office = (user.value(forKey: "Office")) as! String
                            let roleId = ((user.value(forKey: "CategoryID")) as! NSNumber).intValue
                            var role = "Not set"
                            switch roleId {
                            case 1: role = "HIGH"
                            case 2: role = "MEDIUM"
                            case 3: role = "LOW"
                            default: role = "Not set"
                            }
                            
                            userCollectionFromUrl.append(User(id: id, name: name, password: password, office: office, roleId: roleId, role:role))
                            
                            i = i + 1
                            
                        }
                        else {
                            print("nil")
                        }
                        
                    }
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}
//func GetTimeTableFromUrl(url:URL) {

//cycleTimeTableFromUrl.removeAll()

//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//    if error != nil {
//        print (error!)
//    }
//    else {
//
//        print(data!)
//
//        if let urlContent = data {
//
//            do {
//                let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
//
//                print(jsonResult)
//
//
//                let numberOfPosition = (jsonResult as? NSArray)?.count
//                var i = 0
//                while (i < numberOfPosition!) {
//
//                    if let cycleTime = (((jsonResult as? NSArray)?[i]) as? NSObject) {
//
//                        let id = ((cycleTime.value(forKey: "id")) as! NSString).integerValue
//                        let building = (cycleTime.value(forKey: "building")) as! String
//                        let cell = (cycleTime.value(forKey: "cell")) as! String
//                        let position = (cycleTime.value(forKey: "position")) as! String
//                        let time = ((cycleTime.value(forKey: "time")) as! NSString).integerValue
//
//                        cycleTimeTableFromUrl.append(CycleTime(id: id, building: building, cell: cell, position: position, time: time))
//
//                        i = i + 1
//
//                    }
//                    else {
//                        print("nil")
//                    }
//
//                }
//
//            } catch {
//                print ("JSON processing failed")
//
//            }
//        }
//    }
//
//}
//    task.resume()
//
//}

//func GetMonoRealAndAverageCycleTimeFromUrl(url:URL) {
//
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//        if error != nil {
//            print (error!)
//        }
//        else {
//
//            print(data!)
//
//            if let urlContent = data {
//
//                do {
//                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
//
//                    print(jsonResult)
//
//
//                    let numberOfCycleTimeValues = (jsonResult as? NSArray)?.count
//
//                    if (numberOfCycleTimeValues != realTimeCycleTimeCollection.count) {
//                        var i = 0
//                        while (i<numberOfCycleTimeValues!) {
//                            if let tripleDataCycleTime = (((jsonResult as? NSArray)?[i]) as? NSObject) {
//                                let id = ((tripleDataCycleTime.value(forKey: "ID")) as! NSNumber).intValue
//                                let current = ((tripleDataCycleTime.value(forKey: "RealTimeCycleTime")) as! NSNumber).doubleValue
//                                let average = ((tripleDataCycleTime.value(forKey: "AverageTimeCycleTime")) as! NSNumber).doubleValue
//
//                                realTimeCycleTimeCollection.append(TripleDataCycleTime(id: id, current: current, average: average))
//                                i = i+1
//                            }
//                            else {
//                                print("nil")
//
//                            }
//                        }
//                    }
//
//                } catch {
//                    print ("JSON processing failed")
//
//                }
//            }
//        }
//
//    }
//    task.resume()
//
//}

func getServerDateTimeFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    if let downloadedDateTimeString = jsonResult as? NSObject{
                        serverDateTimeString = downloadedDateTimeString.value(forKey: "str") as! String
                    }
                    else {
                        print("nil")
                        
                    }
                    
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}


func GetCycleTimesFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    if let downloadedCycleTime = (((jsonResult as? NSArray)?[0]) as? NSObject) {
                        
                        let id = ((downloadedCycleTime.value(forKey: "id")) as! NSNumber).intValue
                        
                        //        if (id != cycleTime.id) {
                        let operationId = (downloadedCycleTime.value(forKey: "operationId")) as! String
                        let operarionName = (downloadedCycleTime.value(forKey: "operationName")) as! String
                        let standardCT = ((downloadedCycleTime.value(forKey: "standardCT")) as! NSNumber).doubleValue
                        let cycleTimeCollection = (downloadedCycleTime.value(forKey: "cycleTimeCollection")) as! NSArray
                        let averageCT = ((downloadedCycleTime.value(forKey: "averageCT")) as! NSNumber).doubleValue
                        let bestCT = ((downloadedCycleTime.value(forKey: "bestCT")) as! NSNumber).doubleValue
                        let availability = ((downloadedCycleTime.value(forKey: "availability")) as! NSNumber).doubleValue
                        let lastH = ((downloadedCycleTime.value(forKey: "lastH")) as! NSNumber).intValue
                        let lastM = ((downloadedCycleTime.value(forKey: "lastM")) as! NSNumber).intValue
                        let lastS = ((downloadedCycleTime.value(forKey: "lastS")) as! NSNumber).intValue
                        let serverDateTime = downloadedCycleTime.value(forKey: "now") as! String
                        let onGoingTime = (downloadedCycleTime.value(forKey: "onGoing") as! NSNumber).intValue
                        let from0730ToNow = (downloadedCycleTime.value(forKey: "from0730ToNow") as! NSNumber).intValue
                        let totalTime = (downloadedCycleTime.value(forKey: "totalTime") as! NSNumber).intValue
                        
                        cycleTime.id = id
                        cycleTime.operationId = operationId
                        cycleTime.operationName = operarionName
                        if (localStandardCT == 0.0) {
                            cycleTime.standardCT = standardCT
                        }
                        
                        var i = 0;
                        while (i < 10) {
                            let downloadedData = cycleTimeCollection[i] as! NSObject
                            
                            cycleTime.cTCollection[i].a = downloadedData.value(forKey: "a") as! String
                            cycleTime.cTCollection[i].s = downloadedData.value(forKey: "s") as! String
                            cycleTime.cTCollection[i].e = downloadedData.value(forKey: "e") as! String
                            cycleTime.cTCollection[i].d = (downloadedData.value(forKey: "d") as! NSNumber).doubleValue
                            
                            cycleTime.cTCollection[i].sq = (downloadedData.value(forKey: "sq") as! NSNumber).intValue
                            cycleTime.cTCollection[i].c = downloadedData.value(forKey: "c") as! String
                            
                            
                            i = i + 1
                        }
                        
                        cycleTime.averageCT = averageCT
                        cycleTime.bestCT = bestCT
                        cycleTime.availability = availability
                        cycleTime.lastH = lastH
                        cycleTime.lastM = lastM
                        cycleTime.lastS = lastS
                        cycleTime.serverDateTime = serverDateTime
                        cycleTime.onGoingTime = onGoingTime
                        cycleTime.from0730ToNow = from0730ToNow
                        cycleTime.totalTime = totalTime
                        
                        // }
                        
                        
                    }
                        
                    else {
                        print("nil")
                        
                    }
                    
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}

func GetMachinesFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    
                    let numberOfMachines = (jsonResult as? NSArray)?.count
                    
                    var i = 0
                    while (i<numberOfMachines!) {
                        
                        if let machine = (((jsonResult as? NSArray)?[i]) as? NSObject) {
                            let machineId = ((machine.value(forKey: "machineId")) as! NSNumber).intValue
                            let machineName = (machine.value(forKey: "machineName")) as! String
                            let modelNo = (machine.value(forKey: "modelNo")) as! String
                            let line = (machine.value(forKey: "line")) as! String
                            
                            machines.append(Machine(machineId: machineId, machineName: machineName, modelNo: modelNo, line: line))
                            
                            i = i+1
                        }
                        else {
                            print("nil")
                            
                        }
                    }
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}

func GetWorkersFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    
                    let numberOfValues = (jsonResult as? NSArray)?.count
                    
                    var i = 0
                    while (i<numberOfValues!) {
                        
                        if let worker = (((jsonResult as? NSArray)?[i]) as? NSObject) {
                            let workerId = ((worker.value(forKey: "workerId")) as! NSNumber).intValue
                            let workerName = (worker.value(forKey: "workerName")) as! String
                            let leaderId = ((worker.value(forKey: "leaderId")) as! NSNumber).intValue
                            let leaderName = (worker.value(forKey: "leaderName")) as! String
                            
                            workers.append(Worker(workerId: workerId, workerName: workerName, leaderId: leaderId, leaderName: leaderName))
                            
                            i = i+1
                        }
                        else {
                            print("nil")
                            
                        }
                    }
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}

func GetComponentCollectionsFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    
                    let numberOfComponentCollections = (jsonResult as? NSArray)?.count
                    
                    var i = 0
                    while (i<numberOfComponentCollections!) {
                        
                        if let componentCollection = (((jsonResult as? NSArray)?[i]) as? NSArray) {
                            
                            componentCollections.append(componentCollection as! [String])
                            
                            i = i+1
                        }
                        else {
                            print("nil")
                            
                        }
                    }
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}

func GetBuildingsListFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    let numberOfBuildings = (jsonResult as? NSArray)?.count
                    var i = 0
                    while (i<numberOfBuildings!) {
                        if let building = (((jsonResult as? NSArray)?[i]) as? NSObject) {
                            let name = (building.value(forKey: "name")) as! String
                            let status = (building.value(forKey: "status")) as! String
                            let totalOvertime = ((building.value(forKey: "totalOvertime")) as! NSNumber).intValue
                            
                            buildingsList.append(Building(name: name, status: status, totalOvertime: totalOvertime))
                            i = i+1
                        }
                        else {
                            print("nil")
                            
                        }
                    }
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}

func getAnalysisDatasFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    if let downloadedAnalysisDatas = jsonResult as? NSObject{
                        let edo = (downloadedAnalysisDatas.value(forKey: "edo") as! NSNumber).intValue
                        let ebdo = (downloadedAnalysisDatas.value(forKey: "ebdo") as! NSNumber).intValue
                        let edb = (downloadedAnalysisDatas.value(forKey: "edb") as! NSNumber).intValue
                        let dobn = (downloadedAnalysisDatas.value(forKey: "dobn") as! NSNumber).intValue
                        let eho = (downloadedAnalysisDatas.value(forKey: "eho") as! NSNumber).intValue
                        let ebho = (downloadedAnalysisDatas.value(forKey: "ebho") as! NSNumber).intValue
                        let ehb = (downloadedAnalysisDatas.value(forKey: "ehb") as! NSNumber).intValue
                        let hobn = (downloadedAnalysisDatas.value(forKey: "hobn") as! NSNumber).intValue
                        
                        analysis.edo = edo
                        analysis.ebdo = ebdo
                        analysis.edb = edb
                        analysis.dobn = dobn
                        analysis.eho = eho
                        analysis.ebho = ebho
                        analysis.ehb = ehb
                        analysis.hobn = hobn
                    }
                    else {
                        print("nil")
                        
                    }
                    
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}


func GetCellsListFromUrl(url:URL) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if error != nil {
            print (error!)
        }
        else {
            
            print(data!)
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print(jsonResult)
                    
                    let numberOfCells = (jsonResult as? NSArray)?.count
                    var i = 0
                    while (i<numberOfCells!) {
                        if let cell = (((jsonResult as? NSArray)?[i]) as? NSObject) {
                            let name = (cell.value(forKey: "name")) as! String
                            let status = (cell.value(forKey: "status")) as! String
                            let totalOvertime = ((cell.value(forKey: "totalOvertime")) as! NSNumber).intValue
                            
                            cellsListOfCurrentBuilding.append(Cell(name: name, status: status, totalOvertime: totalOvertime))
                            i = i+1
                        }
                        else {
                            print("nil")
                            
                        }
                    }
                    
                    
                } catch {
                    print ("JSON processing failed")
                    
                }
            }
        }
        
    }
    task.resume()
    
}

