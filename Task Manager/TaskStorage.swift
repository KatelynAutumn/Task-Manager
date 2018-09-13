//
//  TaskStorage.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

class Storage {
    
    private var taskArray: [Task] = [Task(title: "Grocery List", details: "apples, bananas, milk, bread" )]
    
    func addTask() {
        
        print("Please enter the title of the task you'd like to create")
        var newTaskTitle = readLine()
        while newTaskTitle == nil || newTaskTitle == "" {
            print("Invalid title, please enter a valid title")
            newTaskTitle = readLine()
        }
        
        
        print("Please add the details of the task you'd like to create")
        var newDetailsTitle = readLine()
        while newDetailsTitle == nil || newDetailsTitle == "" {
            print("Invalid title, please enter a valid title")
            newDetailsTitle = readLine()
        }
        
        let newTask = Task(title: newTaskTitle!, details: newDetailsTitle!)
        taskArray.append(newTask)
        
        let currentCalendar = Calendar.current
        let dateToCompleteBy = currentCalendar.date(byAdding: .day, value: 7, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM, dd, YYYY"
    }
    
    func removeTask() {
        print("Please enter the number of the game you wish to remove")
        
        for index in 0..<taskArray.count {
            print("\(index). \(taskArray[index].title) \(taskArray[index].details)")
        }
        
    
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index")
            userInput = Int(readLine()!)
            
            taskArray.remove(at: userInput!)
        }
    }
    
    func listUncompletedTasks() {
        
        
        for task in taskArray {
            if !task.completed {
                print("Title: \(task.title) , Details: \(task.details)")
                if let dateToCompleteBy = task.dateToCompleteBy {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("This task needs to be completed by \(dateFormatter.string(from: dateToCompleteBy))")
                
            }
        }
    }
    
    func listCompletedTasks() {
        for task in taskArray {
            if task.completed {
                print(task.title , task.details)
                    
                }
            }
        }
    }
}




