//
//  PurchaseVC.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 3/2/18.
//  Copyright © 2018 Ryan McFadden. All rights reserved.
//

import UIKit

class PurchaseVC: UIViewController {

    @IBOutlet weak var requestTxt2: CodeTxtField!
    @IBOutlet weak var responseTxt2: SRCopyableLabel!
    @IBOutlet weak var responseLbl2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let genBtn2 = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        genBtn2.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        genBtn2.setTitle("Generate", for: .normal)
        genBtn2.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        genBtn2.addTarget(self, action: #selector(MainVC.generate), for: .touchUpInside)
        
        requestTxt2.inputAccessoryView = genBtn2
        
        responseTxt2.isHidden = true
        responseLbl2.isHidden = true
    }
    
    @objc func generate() {
        if let requestTxt2 = requestTxt2.text {
            
            if requestTxt2.count != 6 {
                let alertView = UIAlertController(title: "Request Code Error",
                                                  message: "Request Code Needs to be 6 Digits",
                                                  preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Try again", style: .default)
                alertView.addAction(okAction)
                present(alertView, animated: true, completion: nil)
            } else {
                
                //            if let request = Int(requestTxt) {
                //                let newRequest = String(request)
                var codeArray2 = requestTxt2.flatMap{String(String($0))}
                codeArray2.swapAt(3, 0)
                codeArray2.swapAt(3, 1)
                codeArray2.swapAt(5, 2)
                codeArray2.swapAt(4, 2)
                
                var elements = codeArray2
                for (i, digit) in elements.enumerated() {
                    if digit == "1" {
                        elements[i] = "3"
                    } else if digit == "2" {
                        elements[i] = "2"
                    } else if digit == "3" {
                        elements[i] = "1"
                    } else if digit == "4" {
                        elements[i] = "0"
                    } else if digit == "5" {
                        elements[i] = "4"
                    } else if digit == "6" {
                        elements[i] = "3"
                    } else if digit == "7" {
                        elements[i] = "2"
                    } else if digit == "8" {
                        elements[i] = "1"
                    } else if digit == "9" {
                        elements[i] = "0"
                    } else if digit == "0" {
                        elements[i] = "4"
                    }
                    
                }
                
                var codeString2 = ""
                _ = elements.flatMap{ codeString2 = codeString2 + "\($0)" }
                //                let codeInt = Int(codeString)
                view.endEditing(true)
                responseTxt2.isHidden = false
                responseLbl2.isHidden = false
                responseTxt2.text = "\(Code.getRequest(forCode: codeString2))"
                
                //            }
            }
        }
    }
    
    
//    @IBAction func clearCodePressed(_ sender: Any) {
//        responseLbl2.isHidden = true
//        responseTxt2.isHidden = true
//        requestTxt2.text = ""
//    }
    
    
    
}


