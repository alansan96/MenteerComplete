//
//  ChatViewCell.swift
//  AlanChat
//
//  Created by Alan Santoso on 27/04/19.
//  Copyright © 2019 Alan Santoso. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {
    

//    @IBOutlet weak var messageChat: UILabel!
//    func setMessage(message : Message){
//        messageChat.text = message.text
//    }
    
    let messageLabel = UILabel()
    let messageBgView = UIView()
    
    
    // change background view colour accordingly
    var isIncoming: Bool = false {
        didSet {
            messageBgView.backgroundColor = isIncoming ? UIColor.white : #colorLiteral(red: 0.1725490196, green: 0.5960784314, blue: 0.9490196078, alpha: 0.2032052654)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(messageBgView)
        addSubview(messageLabel)
        messageBgView.translatesAutoresizingMaskIntoConstraints = false
        messageBgView.layer.cornerRadius = 10
        
        messageLabel.preferredMaxLayoutWidth = 250
        messageLabel.numberOfLines = 0
        messageLabel.sizeToFit()
        messageLabel.lineBreakMode = .byWordWrapping

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        

        
        // set constraints for the message and the background view
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            
            messageBgView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -13),
            messageBgView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -13),
            messageBgView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 13),
            messageBgView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 13)
        ]
        
        
        NSLayoutConstraint.activate(constraints)
        
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // what we will call from our tableview method
    func configure(with model: Message) {
        isIncoming = model.isIncoming ?? true
        if isIncoming {
            // align to the left
            messageBgView.backgroundColor = isIncoming ? UIColor.white : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)

            messageLabel.text = model.text
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = false
            
          
        }
        else {
            // align to the right
            messageLabel.text = model.text
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = false
        }
    }

}


