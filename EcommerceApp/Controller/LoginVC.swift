//
//  LoginVC.swift
//  EcommerceApp
//
//  Created by Qudsia Mehmood on 22/01/2019.
//  Copyright © 2019 Qudsia Mehmood. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let loginManager = FBSDKLoginManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func LoginBtn(_ sender: Any) {
        guard let email = emailText.text , email.isNotEmpty ,
            let password = passwordText.text , password.isNotEmpty
            else
        {
            alert(title: "Error", msg: "Fill all Fields")
            return
        }
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error
            {
                self.handleFireAuthError(error)
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func forgetBtnClicked(_ sender: Any) {
        let vc = ResetPasswordVC()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func guestBtn(_ sender: Any) {
        loginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if let error =  error {
                debugPrint(error.localizedDescription)  
            } else if (result?.isCancelled)!
            {
                
            }
            else
            {
                
            }
        }
    }
    func signInFacebook()
    {
        
    }
}
