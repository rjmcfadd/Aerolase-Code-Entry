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
        
//        let genBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
//        genBtn.backgroundColor = #colorLiteral(red: 1, green: 0.09386228221, blue: 0.07112337128, alpha: 1)
//        genBtn.setTitle("Generate", for: .normal)
//        genBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        genBtn.addTarget(self, action: #selector(MainVC.generate), for: .touchUpInside)
//        
//        requestTxt.inputAccessoryView = genBtn
//        
//        responseTxt.isHidden = true
//        responseLbl.isHidden = true
//        
        
        
    }
    
    @IBAction func genBtnPressed(_ sender: Any) {
        responseLbl.isHidden = false
        responseTxt.isHidden = false
    }
    


}

