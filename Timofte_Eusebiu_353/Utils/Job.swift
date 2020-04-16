//
//  Job.swift
//  Timofte_Eusebiu_353
//
//  Created by user169475 on 4/16/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import Foundation

class Job {
    let id: Int
    let title: String
    let employer: String
    let location: String
    let publishDate: String
    let description: String
    let domain: String
    
    init(id: Int, title: String, employer: String, location: String, publishDate: String, description: String, domain: String) {
        self.id = id
        self.title = title
        self.employer = employer
        self.location = location
        self.publishDate = publishDate
        self.description = description
        self.domain = domain
    }
}
