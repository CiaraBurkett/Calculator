//
//  StructsEnums.swift
//  Calculator
//
//  Created by Ciara Burkett on 3/15/17.
//  Copyright © 2017 Ciara Burkett. All rights reserved.
//

import Foundation

enum Operator: String {
    // NOTE: There's no reason to have the symbol versus the word
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
