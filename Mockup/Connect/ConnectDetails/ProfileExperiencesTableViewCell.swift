//
//  ProfileExperiencesTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 26/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ProfileExperiencesTableViewCell: UITableViewCell {

    @IBOutlet weak var experienceImage: UIImageView!
    @IBOutlet weak var experienceLabel1: UILabel!
    @IBOutlet weak var experienceLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(data:User.textWithIcon){
        experienceImage.image = data.icon
        experienceLabel1.text = data.text
        experienceLabel2.text = data.text2
    }
    
}
