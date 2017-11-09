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
    
    @IBOutlet weak var responseTxt: UILabel!
    
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
            if let request = Int(requestTxt) {
                view.endEditing(true)
                responseTxt.isHidden = false
                responseLbl.isHidden = false
                responseTxt.text = "\(Code.getRequest(forCode: request))"
                
            }
        }
    }
    

    @IBAction func clearCodePressed(_ sender: Any) {
        responseLbl.isHidden = true
        responseTxt.isHidden = true
        requestTxt.text = ""
    }
    


}

