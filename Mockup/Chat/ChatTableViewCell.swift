//
//  ChatTableViewCell.swift
//  Mockup
//
//  Created by Jesse Joseph on 19/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatNameLabel: UILabel!
    @IBOutlet weak var chatImageView: UIImageView!
    
    func createChatTableCell(person:PersonToChat){
        chatNameLabel.text = person.name
        chatImageView.image = person.image
    }
}
