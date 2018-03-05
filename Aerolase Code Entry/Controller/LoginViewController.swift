//
//  LoginViewController.swift
//  Aerolase Code Entry
//
//  Created by Ryan McFadden on 11/16/17.
//  Copyright © 2017 Ryan McFadden. All rights reserved.
//

import UIKit
import CoreData
import LocalAuthentication


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let usernameKey = "aerolase"
    let passwordKey = "Neo1064nm"

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 8
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
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
    
//    @IBAction func authenticateTapped(_ sender: Any) {
//        let context = LAContext()
//        var error: NSError?
//        
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "Identify yourself!"
//            
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
//                [unowned self] (success, authenticationError) in
//                
//                DispatchQueue.main.async {
//                    if success {
//                        self.performSegue(withIdentifier: "dismissLogin", sender: self)
//                    } else {
//                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
//                        ac.addAction(UIAlertAction(title: "OK", style: .default))
//                        self.present(ac, animated: true)
//                    }
//                }
//            }
//        } else {
//            let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            self.present(ac, animated: true)
//        }
//    }
    
    
}

