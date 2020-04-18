//
//  User.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/18/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation

enum type {
    case employee
    case employer
}

class User {
    
    let id: Int
    let username: String
    var password: String
    let mail: String
    var keywords: [String]
    var cv: Int
    let userType: type
    
    init(id: Int, username: String, password: String, mail: String, keywords: [String], cv: Int , userType: type ) {
        self.id = id
        self.username = username
        self.password = password
        self.mail = mail
        self.keywords = keywords
        self.cv = cv
        self.userType = userType
    }
    
}
