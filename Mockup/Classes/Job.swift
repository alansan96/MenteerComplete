//
//  Job.swift
//  Mockup
//
//  Created by Jesse Joseph on 24/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

class Job{
    var jobImage:UIImage
    var jobName:String
    var jobDesc:String
    var jobCompany:String
    var requirement:[String]=[]
    
    init(jobImage:UIImage,jobName:String,jobDesc:String,requirement:[String],jobCompany:String) {
        self.jobName = jobName
        self.jobDesc = jobDesc
        self.jobImage = jobImage
        self.requirement = requirement
        self.jobCompany=jobCompany
    }
}
