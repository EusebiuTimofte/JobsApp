//
//  Employer.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/20/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation

class Employer: User {
    
    var name: String
    
    init(id: String, username: String, password: String, mail: String, keywords: [String], cv: Int, name: String){
        self.name = name
        super.init(id: id, username: username, password: password, mail: mail, keywords: keywords, cv: cv, userType: .employer)
    }
    
}
