//
//  CodeTxtField.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 11/9/17.
//  Copyright © 2017 Ryan McFadden. All rights reserved.
//

import UIKit

@IBDesignable
class CodeTxtField: UITextField {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
            
        }
        
        func customizeView() {
            backgroundColor = #colorLiteral(red: 0.1165803109, green: 0.1165803109, blue: 0.1165803109, alpha: 0.4412962148)
            layer.cornerRadius = 5.0
            textAlignment = .center
            
            
            if let p = placeholder {
                let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
                attributedPlaceholder = place
                textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }

}
