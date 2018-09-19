//
//  Menu.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

class Menu {
    
    static let sharedInstance = Menu()
    private init() {
        
    }
    
    var shouldQuit = false
    let edit = Edit()
    
    func handleInput(_ input: String) {
        
        switch input {
        case "1":
            Storage.sharedInstance.addTask()
            help()
        case "2":
            Storage.sharedInstance.listAll()
            help()
        case "3":
            Storage.sharedInstance.listUncompletedTasks()
            help()
        case "4":
            Storage.sharedInstance.listCompletedTasks()
            help()
        case "5":
            edit.go()
        case "6":
            help()
        case "7":
            quit()
        default:
            break
        }
        
    }
    
    
    func go() {
        
        help()
        
        repeat{
            
            var input = getInput()
            
            while validateInput(input) == false {
                (print("Invalid input"))
                input = getInput()
            }
            
            handleInput(input)
            
        } while !shouldQuit
    }

    
    func help() {
        print("""

        Please enter the number of the job you wish to perform:
        1. Create New Task
        2. See All Tasks (Completed & Uncompleted)
        3. See All Uncompleted Tasks
        4. See All Completed Tasks
        5. Edit An Existing Task
        6. Help
        7. Exit Task Manager

        """)
        
    
    }
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the Task Manager")
    }

}
