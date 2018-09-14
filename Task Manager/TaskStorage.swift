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
            if task.completed && task.removed{
                completedTasks.append(task)
            }
        }
        return completedTasks
    }
    
    
    func getUncompletedTasks() -> [Task] {
        var uncompletedTasks = [Task]()
        
        for task in taskArray {
            if !task.completed && task.removed{
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
    
    func availableTasks() -> [Task] {
        var Tasks = [Task]()
        
        for task in taskArray {
            if task.removed {
                Tasks.append(task)
            }
        }
        return Tasks
    }
    
    func listAll() {
        let allTasks = availableTasks()
        
        guard allTasks.count > 0 else {
            print("There are no tasks available")
            return
        }
         
        for index in 0..<allTasks.count {
            print("\(index). \(allTasks[index].title) \(allTasks[index].details)")
        }
    }
    
    func listCompletedTasks() {
        let uncompletedTasks = getUncompletedTasks()
        
        guard uncompletedTasks.count > 0 else {
            print("There are no tasks available")
            return
        }
        
        for index in 0..<uncompletedTasks.count {
            print("\(index). \(uncompletedTasks[index].title) \(uncompletedTasks[index].details)")
        }
    }
    
    
    
    func listUncompletedTasks() {
        let completedTasks = getCompletedTasks()
        
        guard completedTasks.count > 0 else {
            print("There are no tasks available")
            return
        }
        
        for index in 0..<completedTasks.count {
            print("\(index). \(completedTasks[index].title) \(completedTasks[index].details)")
        }
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
        
        let allTasks = availableTasks()
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
    
    func checkComplete() {
        
        let allTasks = availableTasks()
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
        
        allTasks[index!].completed = false
    }
    
    
    
    func checkUncomplete() {
        let allTasks = getUncompletedTasks()
        listUncompletedTasks()
        
        
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
        
        allTasks[index!].completed = true
    }
    
    
    
}



