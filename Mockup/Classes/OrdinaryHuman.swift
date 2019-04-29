//
//  OrdinaryHuman.swift
//  Mockup
//
//  Created by Jesse Joseph on 23/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

class OrdinaryHuman{
    var name=""
    var image:UIImage
    var location:String
    var interest:String
    var job:String?
    
    init(name:String,image:UIImage,location:String,interest:String) {
        self.name = name
        self.image = image
        self.interest = interest
        self.location = location
    }

}
