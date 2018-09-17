//
//  TaskStorage.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class Storage {

    //singleton so I can use this later
    static let sharedInstance = Storage()
    private init() {
        
    }
    
    private var taskArray: [Task] = [Task(title: "Grocery List", details: "apples, bananas, milk", priority: "Urgent")]
    
    
    
    //creating an array of completed tasks
    func getCompletedTasks() -> [Task] {
        var completedTasks = [Task]()
        
        for task in taskArray {
            if task.completed && task.removed{
                completedTasks.append(task)
            }
        }
        return completedTasks
    }
    
    //creating an array of uncompleted tasks
    func getUncompletedTasks() -> [Task] {
        var uncompletedTasks = [Task]()
        
        for task in taskArray {
            if !task.completed && task.removed{
                uncompletedTasks.append(task)
            }
        }
        return uncompletedTasks
    }
    
    //creating an array of removed tasks
    func removed() -> [Task] {
        var removedTasks = [Task]()
        
        for task in taskArray {
            if !task.removed {
                removedTasks.append(task)
            }
        }
        return removedTasks
    }
    //creating an array of all tasks, except removed
    func availableTasks() -> [Task] {
        var Tasks = [Task]()
        
        for task in taskArray {
            if task.removed {
                Tasks.append(task)
            }
        }
        return Tasks
    }
    //prints an array from available tasks
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
    //prints an array from getCompletedTasks
    func listCompletedTasks() {
        let completedTasks = getCompletedTasks()
        
        guard completedTasks.count > 0 else {
           print("There are no tasks available")
           return
        }
        
        for index in 0..<completedTasks.count {
            print("\(index). \(completedTasks[index].title) \(completedTasks[index].details)")
        }
    }
    
    //prints uncompleted tasks
    
    func listUncompletedTasks() {
        let uncompletedTasks = getUncompletedTasks()
        
        guard uncompletedTasks.count > 0 else {
            print("There are no tasks available")
            return
        }
        
        for index in 0..<uncompletedTasks.count {
            print("\(index). \(uncompletedTasks[index].title) \(uncompletedTasks[index].details)")
        }
    }
    
    //add task function
    func addTask() {
        
        let dueDate = getDueDate()

        print("What is the priority level for this task? (Critical, Important, Normal, Low)")
        var newPriority = readLine()
        while newPriority == nil || newPriority == ""  {
            print("Invalid title, please enter a valid title")
            newPriority = readLine()
        }
        
        
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
        
        let newTask = Task(title: newTaskTitle!, details: newDetailsTitle!, priority: newPriority! )
        taskArray.append(newTask)
        
        
    }
    
    //remove task function
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
    
    
    //moves array from uncomplete to complete
    func checkComplete() {
        
        let allTasks = getUncompletedTasks()
        listUncompletedTasks()
        
        if allTasks.count <= 0 {
            return
        }
        
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
    
    
    //moves array back from uncomplete to complete
    func checkUncomplete() {
        let allTasks = getCompletedTasks()
        listCompletedTasks()
        
        if allTasks.count <= 0 {
            return
        }
        
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
    
    
}




