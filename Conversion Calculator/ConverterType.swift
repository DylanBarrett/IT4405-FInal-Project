//
//  ConverterType.swift
//  Conversion Calculator
//
//  Created by Dylan barrett on 4/23/19.
//  Copyright © 2019 Dylan barrett. All rights reserved.
//

import Foundation

class converterType {
    var conversionType = 0
    var decimal = false

    let convertArray: Array<Conversions> = [
        Conversions(label: "Farenheit to Celsius", inputUnit: " °F", outputUnit: " °C"),
        Conversions(label: "Celsius to Farenheit", inputUnit: " °C", outputUnit: " °F"),
        Conversions(label: "Miles to Kilometers", inputUnit: " mi", outputUnit: " km"),
        Conversions(label: "Kilometers to Miles", inputUnit: " km", outputUnit: " mi")]
    
    func convert(_ inputNumber: Double) -> Double{
        switch conversionType {
        case 0:
            return Double((inputNumber - 32)/(9/5))
        case 1:
            return Double((inputNumber + 32) * (9/5))
        case 2:
            return Double(inputNumber * 0.62137119)
        case 3:
            return Double(inputNumber/1.609344)
        default:
            return 0
        }
    }
}
