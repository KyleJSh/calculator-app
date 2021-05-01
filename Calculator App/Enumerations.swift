//
//  Enumerations.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-05-01.
//

import Foundation

struct Enumerations {
    
    enum Operations: Int {
        case add = 0
        case subtract = 1
        case multiply = 2
        case divide = 3
    }
    
    enum Columns: Int {
        case firstFromLeft = 0
        case secondFromLeft = 1
        case thirdFromLeft = 2
        case fourthFromLeft = 3
    }
}
