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
 
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            if textField == usernameTextField {
                textField.resignFirstResponder()
                passwordTextField.becomeFirstResponder()
            } else if textField == passwordTextField {
                textField.resignFirstResponder()
            }
            return true
        }
        
        if UserDefaults.standard.object(forKey: "SignedIn") != nil{
            
            let context:LAContext = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login with TouchID", reply: { (wasCorrect, error) in
                    if wasCorrect
                    {
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "codeEntry", sender: self.navigationController)
                        }                        
                    }
                    else {
                        func errorMessageForFails(errorCode: Int) -> String {
                            
                            var message = ""
                            
                            switch errorCode {
                            case LAError.authenticationFailed.rawValue:
                                message = "Authentication was not successful, because user failed to provide valid credentials"
                                
                            case LAError.appCancel.rawValue:
                                message = "Authentication was canceled by application"
                                
                            case LAError.invalidContext.rawValue:
                                message = "LAContext passed to this call has been previously invalidated"
                                
                            case LAError.notInteractive.rawValue:
                                message = "Authentication failed, because it would require showing UI which has been forbidden by using interactionNotAllowed property"
                                
                            case LAError.passcodeNotSet.rawValue:
                                message = "Authentication could not start, because passcode is not set on the device"
                                
                            case LAError.systemCancel.rawValue:
                                message = "Authentication was canceled by system"
                                
                            case LAError.userCancel.rawValue:
                                message = "Authentication was canceled by user"
                                
                            case LAError.userFallback.rawValue:
                                message = "Authentication was canceled, because the user tapped the fallback button"
                                
                            case LAError.biometryNotAvailable.rawValue:
                                message = "Authentication could not start, because biometry is not available on the device"
                                
                            case LAError.biometryLockout.rawValue:
                                message = "Authentication was not successful, because there were too many failed biometry attempts and                          biometry is now locked"
                                
                            case LAError.biometryNotEnrolled.rawValue:
                                message = "Authentication could not start, because biometric authentication is not enrolled"
                                
                            default:
                                message = errorMessageForFailsDeprecatediniOS11(errorCode: errorCode)
                            }
                            
                            return message
                        }
                        func errorMessageForFailsDeprecatediniOS11(errorCode: Int) -> String {
                            var message = ""
                            if #available(iOS 11.0, macOS 10.13, *) {
                                message = "unknown error"
                            } else {
                                switch errorCode {
                                case LAError.touchIDLockout.rawValue:
                                    message = "Authentication was not successful, because there were too many failed Touch ID attempts and Touch ID is now locked. Passcode is required to unlock Touch ID"
                                    
                                case LAError.touchIDNotAvailable.rawValue:
                                    message = "Authentication could not start, because Touch ID is not available on the device"
                                    
                                case LAError.touchIDNotEnrolled.rawValue:
                                    message = "Authentication could not start, because Touch ID is not enrolled on the device"
                                default :
                                    message = "unknown error"
                                }
                            }
                            
                            return message
                        }
                    }
                })
            }
        }

    }

    @IBAction func loginAction(_ sender: Any) {
        
         func checkLogin(username: String, password: String) -> Bool {
            return username == usernameKey && password == passwordKey
        }
        if checkLogin(username: usernameTextField.text!, password: passwordTextField.text!) {
            performSegue(withIdentifier: "dismissLogin", sender: self)
            UserDefaults.standard.set("Yes", forKey: "SignedIn")
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

