//
//  HomeGoalsTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 25/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class HomeGoalsTableViewCell: UITableViewCell {

    @IBOutlet weak var goalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(data:String){
        goalLabel.text = data
    }

}
