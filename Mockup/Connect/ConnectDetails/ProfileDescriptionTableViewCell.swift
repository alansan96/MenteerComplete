//
//  ProfileDescriptionTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 26/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ProfileDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  setCell(data:String){
        descriptionLabel.text = data
    }

}
