//
//  Jwt.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-04-03.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation
//import Alamofire
//import JWTDecode




func requestGetAuthenticateResponse(username:String,password:String) {

//    let response = AF.request("https://10.4.5.61:8067/api/login/dang-nhap", method: .post).authenticate(username: username, password: password).responseJSON
//
//    print("Response: \(response)")
    
    
    
    /**
     Calls the Login Web Service to authenticate the user
     */
    
//    AF.request("https://10.4.5.61:8067/api/login/dang-nhap", method: .post,  encoding: JSONEncoding.default).authenticate(username: username, password: password)
//        .responseJSON { response in
//            print(response)
//            //to get status code
//            if let status = response.response?.statusCode {
//                switch(status){
//                case 201:
//                    print("example success")
//                default:
//                    print("error with response status: \(status)")
//                }
//            }
//            //to get JSON return value
//            if let result = response.value {
//                let JSON = result as! NSDictionary
//                print(JSON)
//            }
//
//    }
//
    
}

//func requestGetAuthenticateData(username:String,password:String) -> Data {
    //do catch
    
//    let data = AF.request("https://10.4.5.61:8066/api/login/dang-nhap", method: .get).authenticate(username: username, password: password).data
//
//    print("Data:")
//    print(data as Any)
//
//    return(data!)
//}

func decodeDataFromJsonToUserInformation(username:String,password:String) {
    
//    do {
//
//        let jsonResult = try JSONSerialization.jsonObject(with: requestGetAuthenticateData(username:username,password:password) as Data, options:
//            JSONSerialization.ReadingOptions.mutableContainers)
//
//        print(jsonResult)
//
//        currentToken = ((jsonResult as? NSArray)?.firstObject) as! Token
//
//        currentUser.id = (try decode(jwt: currentToken.content)).claim(name: "id").integer!
//        print(currentUser.id)
//
//        currentUser.name = (try decode(jwt: currentToken.content)).claim(name: "name").string!
//        print(currentUser.name
//        )
//        currentUser.office = (try decode(jwt: currentToken.content)).claim(name: "office").string!
//        print(currentUser.office
//        )
//        currentUser.roleId = (try decode(jwt: currentToken.content)).claim(name: "role").integer!
//        print(currentUser.roleId)
//
//            } catch {
//                print ("JSON processing failed")
//                //login again
//            }
}

func requestGetPermissionToViewCycleTime(token:Token) {
        
    
}

//func getTokenString() -> String {
//
////    let data = decodeDataFromJsonToDictionary()
//
//    //let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//
//    let tokenHeader = (decodeDataFromJsonToArray()[0] as! JWT).header
//
//    let tokenAsTring = (tokenHeader as! [String:String]).first!.value
//
//    return(tokenAsTring)
//}
//
//func decodeToken() -> User {
//
//    let user =  try? decode(jwt: getTokenString()) as! User
//    return(user!)
//}
