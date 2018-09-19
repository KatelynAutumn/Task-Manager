//
//  main.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation

print("Welcome, please enter the passphrase")
var userInput = readLine()
let passphrase = "secret"

repeat{
    if userInput != passphrase {
        print("invald entry please enter the correct passphrase")
        userInput = readLine()
    }
    
    if userInput == passphrase {
        print("Task Manager:")

        let menu = Menu.sharedInstance
        menu.go()

        let edit = Edit()
        edit.go()
    }
} while userInput != passphrase
