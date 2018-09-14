//
//  TaskDetails.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class Task {
    var title: String
    var details: String
    var completed = true
    var dateToCompleteBy: Date?
    var removed = true
    
    init(title: String, details: String) {
        self.title = title
        self.details = details
    }
}

