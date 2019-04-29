//
//  ScheduleTableViewCell.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var colors: UIImageView!
    @IBOutlet weak var colors2: UIImageView!
    
    
    
    func setScehdule(s : Schedule){
        var color = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black, UIColor.magenta,#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)]
        let random = Int(arc4random_uniform(UInt32(color.count-1)))
        
        let selectedColor = color[random]
        colors.backgroundColor = selectedColor
        colors2.backgroundColor = selectedColor
        
        colors.layer.cornerRadius = 5
        colors2.layer.cornerRadius = 5
        
        
        nameLabel.text = s.title
        dateLabel.text = s.date
        
    }

}


