//
//  Message.swift
//  AlanChat
//
//  Created by Alan Santoso on 27/04/19.
//  Copyright © 2019 Alan Santoso. All rights reserved.
//

import Foundation


class Message {
    var fromId :String?
    var text : String?
    var timestamp : String?
    var toId :String?
    var isIncoming : Bool?
    
    init(fromId : String, text : String, timestamp : String, toId: String) {
        self.fromId = fromId
        self.text = text
        self.timestamp = timestamp
        self.toId = toId
    }
    
    init() {
        
    }
    
}
