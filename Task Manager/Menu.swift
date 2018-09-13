//
//  Menu.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

class Menu {
    
    var shouldQuit = false
    let storage = Storage()
    
    func handleInput(_ input: String) {
        
        switch input {
        case "1":
            storage.addTask()
        case "2":
            print("not yet ready")
        case "3":
            print("not yet ready")
        case "4":
            print("not yet ready")
        case "5":
            print("not yet ready")
        case "6":
            print("not yet ready")
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
        3. See All Completed Tasks
        4. See All Uncompleted Tasks
        5. Delete A Task
        6. Help
        7. Exit Task Manager

        """)
        
    
    }
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the Task Manager")
    }

}
