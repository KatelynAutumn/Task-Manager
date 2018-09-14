//
//  TaskStorage.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class Storage {

    
    static let sharedInstance = Storage()
    private init() {
        
    }
    
    private var taskArray: [Task] = [Task(title: "Grocery List", details: "apples, bananas, milk")]
    
    
    func getCompletedTasks() -> [Task] {
        var completedTasks = [Task]()
        
        for task in taskArray {
            if task.completed {
                completedTasks.append(task)
            }
        }
        return completedTasks
    }
    
    
    func getUncompletedTasks() -> [Task] {
        var uncompletedTasks = [Task]()
        
        for task in taskArray {
            if !task.completed {
                uncompletedTasks.append(task)
            }
        }
        return uncompletedTasks
    }
    
    func removed() -> [Task] {
        var removedTasks = [Task]()
        
        for task in taskArray {
            if !task.removed {
                removedTasks.append(task)
            }
        }
        return removedTasks
    }
    
    func Tasks() -> [Task] {
        var Tasks = [Task]()
        
        for task in taskArray {
            if task.removed {
                Tasks.append(task)
            }
        }
        return Tasks
    }
    

    func addTask() {
        
        let dueDate = getDueDate()
        
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
        
        
    }
    
    func removeTask() {
        
        let allTasks = Tasks()
        listAll()
        
        
        var index : Int? = nil
        
        repeat {
            
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid input. Please enter a usable index")
                userInput = Int(readLine()!)
            }
            if userInput! >= 0 && userInput! <
                allTasks.count {
                index = userInput!
            }  else {
                print("Please enter a valid index.")
                continue
            }
            
        } while index == nil
        
        allTasks[index!].removed = false
    }
    
  
    
    func listAll() {
        let allGames = Tasks()
        
        guard allGames.count > 0 else {
            print("There are no tasks to remove")
            return
        }
        
        for index in 0..<allGames.count {
                print("\(index). \(allGames[index].title) \(allGames[index].details)")
        }
    }
    
    
    func listUncompletedTasks() {
        for task in taskArray {
            if task.completed {
                print("Title: \(task.title) , Details: \(task.details)")
            }
        }
        
    }
    
        
    func listCompletedTasks() {
        for task in taskArray {
            if !task.completed {
                print(task.title , task.details)
                    
                }
            }
        }

}



