//
//  Utilities.swift
//  Task Manager
//
//  Created by Katelyn Pace on 9/12/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation




func validateInput(_ input: String) -> Bool {
    let menuOptions = Array(1...7)
    
    guard let number = Int(input) else { return false }
    
    return menuOptions.contains(number)
}


func validateInput2(_ input: String) -> Bool {
    let menuOptions = Array(1...4)
    
    guard let number = Int(input) else { return false }
    
    return menuOptions.contains(number)
}



func getInput() -> String {
    var input: String? = nil
    
    repeat{
        let line =
            readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != "" {
            input = line
        } else {
            print("Invalid input.")
        }
    } while input == nil
    
    return input!
}

func getDueDate() -> Date {
    
    var dueDate: Date?
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yy"
    
    print("Please enter the date you would like to complete this by in mm/dd/yy format:")
    
    repeat {
        let userInput = readLine()!
        
        if let newDate = dateFormatter.date(from: userInput) {
            dueDate = newDate
        } else {
            print("Please enter a valid date.")
        }
    } while dueDate == nil
    
    return dueDate!
}



