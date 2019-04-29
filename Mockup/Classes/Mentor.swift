//
//  Mentor.swift
//  Mockup
//
//  Created by Jesse Joseph on 22/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

class Mentor:User{
    
    init(name: String, image: UIImage, phone: String, email: String, reviews: [textWithIcon], jobExperience: [textWithIcon], education: [textWithIcon], others: [textWithIcon], goal: [String], desc: String,material:String,method:String) {
        super.init(name: name, image: image, phone: phone, email: email, reviews: reviews, jobExperience: jobExperience, education: education, others: others, goal: goal, desc:desc)
        self.material = material
        self.method = method
    }
}

