//
//  Structs:Enums.swift
//  Calculator
//
//  Created by Ryan Lim on 8/9/16.
//  Copyright © 2016 Ryan Lim. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}

