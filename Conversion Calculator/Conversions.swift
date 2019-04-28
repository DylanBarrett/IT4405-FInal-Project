//
//  Conversions.swift
//  Conversion Calculator
//
//  Created by Dylan barrett on 4/6/19.
//  Copyright © 2019 Dylan barrett. All rights reserved.
//

import Foundation

struct Conversions {
    var label: String
    var inputUnit: String
    var outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
