//
//  User.swift
//  Mockup
//
//  Created by Jesse Joseph on 22/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

class User{
    var name:String
    var Image:UIImage
    var phone:String
    var email :String
    var goal:[String]
    var desc:String
    
    class textWithIcon{
        var icon:UIImage
        var text:String
        var text2:String
        init(icon:UIImage,text:String,text2:String) {
            self.icon = icon
            self.text = text
            self.text2 = text2
        }
    }
    
    var reviews:[textWithIcon]
    var jobExperience:[textWithIcon]
    var education:[textWithIcon]
    var others:[textWithIcon]
    var material:String?
    var method:String?
    
    init(name:String,image:UIImage,phone:String,email:String,reviews:[textWithIcon],jobExperience:[textWithIcon],education:[textWithIcon],others:[textWithIcon],goal:[String],desc:String) {
        self.name = name
        self.Image = image
        self.phone = phone
        self.email = email
        self.reviews = reviews
        self.education = education
        self.jobExperience = jobExperience
        self.others = others
        self.goal = goal
        self.desc = desc
    }
    
}
