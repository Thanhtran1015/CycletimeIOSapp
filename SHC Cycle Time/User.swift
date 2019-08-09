//
//  User.swift
//  RegisterLoginApp
//
//  Created by Mac Project PC on 2019-03-26.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import Foundation

class User {
    
    var id:Int
    var name:String
    var password:String
    var office:String
    var roleId:Int
    var role:String
    
    init(id:Int,name:String,password:String,office:String,roleId:Int,role:String) {
        self.id = id
        self.name = name
        self.password = password
        self.office = office
        self.roleId = roleId
        self.role = role
    }
}
