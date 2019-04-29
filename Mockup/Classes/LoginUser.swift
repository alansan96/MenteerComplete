//
//  LoginUser.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import Foundation

class LoginUser{
    var name : String
    var role : String
    var id : String?
    var userImage : String?
    
    init(name : String, role : String){
        self.name = name
        self.role = role
    }
    
}
