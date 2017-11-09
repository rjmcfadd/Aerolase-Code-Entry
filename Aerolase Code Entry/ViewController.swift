//
//  ViewController.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 11/2/17.
//  Copyright © 2017 Ryan McFadden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var code: String = ""

    @IBOutlet weak var requestCode: UITextField!
    @IBOutlet weak var responseCode: UITextField!
    
    @IBAction func genBtnPressed(_ sender: Any) {
//        let requestCodeConv :Int? = Int(requestCode.text!)
//
//
//        let result = requestCodeConv!
//        responseCode.text = String(result)
        var numSwitch: [String: String] = ["0": "0", "1": "4", "2": "3", "3": "2", "4": "1", "5": "0", "6": "4", "7": "3", "8": "2", "9": "1"]
        
        for (oldNum, newNum) in numSwitch {
            print("\(oldNum): \(newNum)")
        }
        
        let code = requestCode.text!
        var codeArray = code.flatMap{Int(String($0))}

        codeArray.rearrange(from: 3, to: 1)
        codeArray.rearrange(from: 4, to: 3)

        var stringCodeArray = codeArray.map {
            String($0)
        }
        let characterCode = stringCodeArray.flatMap { String.CharacterView($0) }
        let stringCode = String(describing: stringCodeArray)
        responseCode.text = stringCode
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func responseCode(_textFieldToChange: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
}


