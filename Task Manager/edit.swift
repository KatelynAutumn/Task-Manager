//
//  edit.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/13/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class Edit {
    
    var shouldQuit = false
    
    func go() {
        
        help()
            
            var input2 = getInput()
            
            while validateInput2(input2) == false {
                (print("Invalid input"))
                input2 = getInput()
            }
            
            handleInput2(input2)
    }
    
    
    func handleInput2(_ ar: String) {
        
        switch ar {
        case "1":
            Storage.sharedInstance.checkComplete()
            menu.help()
        case "2":
            Storage.sharedInstance.checkUncomplete()
            menu.help()
        case "3":
            Storage.sharedInstance.checkComplete()
            menu.help()
        case "4":
            Storage.sharedInstance.removeTask()
            menu.help()
        default:
            break
        }
        
    }
    func help() {
        print("""

        Please enter the number of the job you wish to perform:
        1. Mark A Task Complete
        2. Mark A Task Uncomplete
        3. Edit A Task
        4. Delete A Task
        """)
        
    }
   
    
}
    
