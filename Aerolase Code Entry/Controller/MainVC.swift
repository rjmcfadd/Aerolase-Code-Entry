//
//  ViewController.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 11/2/17.
//  Copyright © 2017 Ryan McFadden. All rights reserved.
//

import UIKit


class MainVC: UIViewController {

    @IBOutlet weak var requestTxt: UITextField!
    
    @IBOutlet weak var responseTxt: SRCopyableLabel!
    
    @IBOutlet weak var responseLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let genBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
            genBtn.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            genBtn.setTitle("Generate", for: .normal)
            genBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            genBtn.addTarget(self, action: #selector(MainVC.generate), for: .touchUpInside)
            
            requestTxt.inputAccessoryView = genBtn
            
            responseTxt.isHidden = true
            responseLbl.isHidden = true
        }

        
        
        
    

    
    @objc func generate() {
        if let requestTxt = requestTxt.text {
            
            if requestTxt.count < 6 {
                let alertView = UIAlertController(title: "Request Code Error",
                                                  message: "Request Code Needs to be 6 Digits",
                                                  preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Try again", style: .default)
                alertView.addAction(okAction)
                present(alertView, animated: true, completion: nil)
            } else {
            
//            if let request = Int(requestTxt) {
//                let newRequest = String(request)
                var codeArray = requestTxt.flatMap{String(String($0))}
                codeArray.swapAt(3, 1)
                codeArray.swapAt(3, 2)
                codeArray.swapAt(4, 3)
            
                var elements = codeArray
                for (i, digit) in elements.enumerated() {
                    if digit == "1" {
                        elements[i] = "4"
                    } else if digit == "2" {
                        elements[i] = "3"
                    } else if digit == "3" {
                        elements[i] = "2"
                    } else if digit == "4" {
                        elements[i] = "1"
                    } else if digit == "5" {
                        elements[i] = "0"
                    } else if digit == "6" {
                        elements[i] = "4"
                    } else if digit == "7" {
                        elements[i] = "3"
                    } else if digit == "8" {
                        elements[i] = "2"
                    } else if digit == "9" {
                        elements[i] = "1"
                    } else if digit == "0" {
                        elements[i] = "0"
                    }
                
                }
                
                var codeString = ""
                _ = elements.flatMap{ codeString = codeString + "\($0)" }
//                let codeInt = Int(codeString)
                view.endEditing(true)
                responseTxt.isHidden = false
                responseLbl.isHidden = false
                responseTxt.text = "\(Code.getRequest(forCode: codeString))"
                
//            }
        }
        }
    }
    

    @IBAction func clearCodePressed(_ sender: Any) {
        responseLbl.isHidden = true
        responseTxt.isHidden = true
        requestTxt.text = ""
    }
    


}

