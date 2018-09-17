//
//  TaskDetails.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

//here are all the details of the task

class Task {
    var title: String
    var details: String
    var completed = false
    var dateToCompleteBy: Date?
    var removed = true
    var priority: String
    
    init(title: String, details: String, priority: String) {
        self.title = title
        self.details = details
        self.priority = priority
    }
}

