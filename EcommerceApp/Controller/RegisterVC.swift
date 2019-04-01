//
//  RegisterVC.swift
//  EcommerceApp
//
//  Created by Qudsia Mehmood on 22/01/2019.
//  Copyright © 2019 Qudsia Mehmood. All rights reserved.
//

import UIKit
import Firebase
class RegisterVC: UIViewController {
    
    @IBOutlet weak var matchPasswordImg: UIImageView!
    @IBOutlet weak var passImgCheck: UIImageView!
    @IBOutlet weak var UsernameText: UITextField!
    @IBOutlet weak var userEmailTxt: UITextField!
    @IBOutlet weak var userPasswordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField : UITextField)
    {
        guard let passtxt = userPasswordTxt.text
            else {
                return
        }
        if textField == confirmPasswordTxt
        {
            passImgCheck.isHidden = false
            matchPasswordImg.isHidden = false
            
        }
        else
        {
            if passtxt.isEmpty {
                passImgCheck.isHidden = true
                matchPasswordImg.isHidden = true
                confirmPasswordTxt.text = ""
            }
        }
        
        if userPasswordTxt.text == confirmPasswordTxt.text
        {
            passImgCheck.image = UIImage(named: AppUI.GreenCheck)
            matchPasswordImg.image = UIImage(named: AppUI.GreenCheck)
        }
        else
        {
            passImgCheck.image = UIImage(named: AppUI.RedCheck)
            matchPasswordImg.image = UIImage(named: AppUI.RedCheck)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        guard let email = userEmailTxt.text , email.isNotEmpty,
            let password = userPasswordTxt.text  , password.isNotEmpty,
            let userName = UsernameText.text , userName.isNotEmpty
            else
        {
           self.alert(title: "Error", msg: "Fill all fileds")
            return
        }
        guard let confirmPassword = confirmPasswordTxt.text ,confirmPassword.isNotEmpty, confirmPassword == password
            else {
                alert(title: "Error", msg: "Password doesn't match")
                return
        }

        activityLoader.startAnimating()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error
            {
                self.handleFireAuthError(error)
                debugPrint(error.localizedDescription)
                self.activityLoader.stopAnimating()
                return
            }
            self.activityLoader.stopAnimating()
            self.dismiss(animated: true, completion: nil)
//            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
//            guard let user = Auth.auth().currentUser else
//            {
//                return
//            }
//            user.linkAndRetrieveData(with: credential, completion: { (user , error) in
//                
//            })
            
        }

    }
    @IBAction func linkWithFacebookBtnClicked(_ sender: Any) {
        
    }
    
}
