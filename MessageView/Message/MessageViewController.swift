//
//  MessageViewController.swift
//  MessageView
//
//  Created by 김기현 on 2023/02/28.
//

import Foundation

class Message {
    var sender: String
    var text: String
    var date: Date

    init(sender: String, text: String, date: Date) {
        self.sender = sender
        self.text = text
        self.date = date
    }
}

