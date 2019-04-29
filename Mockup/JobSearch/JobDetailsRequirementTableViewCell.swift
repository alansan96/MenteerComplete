//
//  JobDetailsRequirementTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 24/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class JobDetailsRequirementTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var jobRequirementLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(requirement:String){
        jobRequirementLabel.text = requirement
    }

}
