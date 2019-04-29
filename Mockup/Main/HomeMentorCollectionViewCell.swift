//
//  HomeMentorCollectionViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 25/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class HomeMentorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mentorImage: UIImageView!
    
    func setCell(data:UIImage){
        mentorImage.image = data
    }
    
}
