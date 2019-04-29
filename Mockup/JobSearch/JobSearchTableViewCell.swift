//
//  JobSearchTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 24/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class JobSearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobCompanyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(jobs:Job){
        jobImage.image = jobs.jobImage
        jobTitleLabel.text = jobs.jobName
        jobCompanyLabel.text = jobs.jobCompany
    }

}
