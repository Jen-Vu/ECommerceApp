//
//  Extension.swift
//  EcommerceApp
//
//  Created by Qudsia Mehmood on 22/01/2019.
//  Copyright © 2019 Qudsia Mehmood. All rights reserved.
//

import Foundation
import Firebase
extension String {
    var isNotEmpty : Bool
    {
        return !isEmpty
    }
}

extension UIViewController
{
    func handleFireAuthError(_ error : Error )
        {
            if let errorCode = AuthErrorCode(rawValue: error._code)
            {
                let errorAlert = UIAlertController(title: "Error", message: errorCode.errorMassage, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                errorAlert.addAction(okAction)
                self.present(errorAlert, animated: true, completion: nil)
            }
    }
    func alert(title : String , msg: String)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)

    }
}

extension AuthErrorCode
{
    var errorMassage : String
    {
        switch self {
        case .emailAlreadyInUse:
            return "This email is already used with another account"
        case .userNotFound:
            return "User doesn't found for specified account , please check again"
        case .userDisabled:
            return "Your account has been disabled"
        case .invalidEmail , .invalidSender , .invalidRecipientEmail:
            return "Please Enter a Valid Email"
        case .networkError:
            return "Network error has been occured, Please try Again"
        case .weakPassword:
            return "Your Password is not Strong, please make a strong password"
        case .wrongPassword:
            return "Ypur password or email is incorrect"
        default:
            return "Sorry something went wrong"
        }
    }
}
