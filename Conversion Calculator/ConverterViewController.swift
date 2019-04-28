//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Dylan barrett on 4/6/19.
//  Copyright © 2019 Dylan barrett. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    let conversionTypes = converterType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text = conversionTypes.convertArray[0].outputUnit
        inputDisplay.text = conversionTypes.convertArray[0].inputUnit
    }
    
    @IBAction func conversionAction(_ sender: Any) {
        let actionSheetConversion = UIAlertController(title: "Conversions", message: "Select a conversion type", preferredStyle: UIAlertController.Style.actionSheet)
        
        let fahrToCel = UIAlertAction(title: conversionTypes.convertArray[0].label, style: .default) { action in
            self.conversionTypes.conversionType = 0
            self.conversionButton()
        }
        
        let celToFahr = UIAlertAction(title: conversionTypes.convertArray[1].label, style: .default) { action in
            self.conversionTypes.conversionType = 1
            self.conversionButton()
        }
        
        let milToKilo = UIAlertAction(title: conversionTypes.convertArray[2].label, style: .default) { action in
            self.conversionTypes.conversionType = 2
            self.conversionButton()
        }
        
        let kiloToMil = UIAlertAction(title: conversionTypes.convertArray[3].label, style: .default) { action in
            self.conversionTypes.conversionType = 3
            self.conversionButton()
        }
        
        actionSheetConversion.addAction(fahrToCel)
        actionSheetConversion.addAction(celToFahr)
        actionSheetConversion.addAction(milToKilo)
        actionSheetConversion.addAction(kiloToMil)
        
        present(actionSheetConversion, animated: true, completion: nil)
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        var inputString = inputDisplay.text
        if inputString!.hasPrefix(" ") {
            return
        } else {
            if inputString!.hasPrefix("-") {
                inputString!.remove(at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabelFromInput()
                
                if inputString != "." {
                    let conversionInput = Double(inputString!)
                    outputDisplay.text = String(conversionTypes.convert(conversionInput!)) + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
                } else {
                    outputDisplay.text = inputString! + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
                }
            } else {
                inputString!.insert("-", at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabelFromInput()
                if inputString != "-." {
                    let conversionInput = Double(inputString!)
                    outputDisplay.text = String(conversionTypes.convert(conversionInput!)) + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
                } else {
                    outputDisplay.text = inputString! + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
                }
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        inputDisplay.text = conversionTypes.convertArray[conversionTypes.conversionType].inputUnit
        outputDisplay.text = conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
        conversionTypes.decimal = false
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        numberUpdate(sender.titleLabel!.text!)
    }
    
    func numberUpdate(_ inputNumber: String) {
        if inputNumber == "." && conversionTypes.decimal == true {
            return
        } else if inputNumber == "." && conversionTypes.decimal == false {
            conversionTypes.decimal = true
        }
        
        var inputString = removeLabelFromInput()
        inputString += inputNumber
        
        let conversionInput = Double(inputString)
        
        inputString += conversionTypes.convertArray[conversionTypes.conversionType].inputUnit
        
        if inputString.hasPrefix(".") {
            inputDisplay.text = inputString
            outputDisplay.text = inputNumber + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
        } else {
            inputDisplay.text = inputString
            outputDisplay.text = String(conversionTypes.convert(conversionInput!)) + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
        }
    }
    
    func conversionButton() {
        let inputString = removeLabelFromInput()
        let conversionInput = Double(inputString)
        
        inputDisplay.text = inputString + conversionTypes.convertArray[conversionTypes.conversionType].inputUnit
        
        if inputString != "" {
            if inputString == "." && inputString == "-." {
                outputDisplay.text = inputString + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
            } else {
                outputDisplay.text =  String(conversionTypes.convert(conversionInput!)) + conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
            }
        } else {
            outputDisplay.text = conversionTypes.convertArray[conversionTypes.conversionType].outputUnit
        }
    }
    
    func removeLabelFromInput() -> String {
        var inputString = inputDisplay.text
        let inputLabel = (inputString!.index(inputString!.endIndex, offsetBy: -3))..<inputString!.endIndex
        inputString!.removeSubrange(inputLabel)
        return inputString!
    }
}
