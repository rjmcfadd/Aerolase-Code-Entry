//
//  LoginViewController.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 11/16/17.
//  Copyright © 2017 Ryan McFadden. All rights reserved.
//

import UIKit
import CoreData


class LoginViewController: UIViewController {
    
    let usernameKey = "aerolase"
    let passwordKey = "Neo1064nm"

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginAction(_ sender: Any) {
        func checkLogin(username: String, password: String) -> Bool {
            return username == usernameKey && password == passwordKey
        }
        if checkLogin(username: usernameTextField.text!, password: passwordTextField.text!) {
            performSegue(withIdentifier: "dismissLogin", sender: self)
        } else {
            let alertView = UIAlertController(title: "Login Problem",
                                              message: "Do you work for Aerolase?",
                                              preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Try again", style: .default)
            alertView.addAction(okAction)
            present(alertView, animated: true, completion: nil)
        }
    }
    
    
}

