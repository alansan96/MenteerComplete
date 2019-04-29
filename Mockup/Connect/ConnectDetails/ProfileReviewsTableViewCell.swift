//
//  ProfileReviewsTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 26/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ProfileReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewLabel1: UILabel!
    @IBOutlet weak var reviewLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(data:User.textWithIcon){
        reviewImage.image = data.icon
        reviewLabel1.text = data.text
        reviewLabel2.text = data.text2
    }

}
