//
//  HomeUpcomingTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 25/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class HomeUpcomingTableViewCell: UITableViewCell {

    @IBOutlet weak var upcomingImage: UIImageView!
    @IBOutlet weak var upcomingName: UILabel!
    @IBOutlet weak var upcomingMaterial: UILabel!
    @IBOutlet weak var upcomingSchedule: UILabel!
    @IBOutlet weak var upcomingType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(image:UIImage,name:String,material:String,schedule:String,type:String){
        upcomingImage.image = image
        upcomingName.text = name
        upcomingMaterial.text = material
        upcomingSchedule.text = schedule
        upcomingType.text = type
        
    }
    
}
