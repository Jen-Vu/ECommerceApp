//
//  ResetPasswordVC.swift
//  EcommerceApp
//
//  Created by Qudsia Mehmood on 25/01/2019.
//  Copyright © 2019 Qudsia Mehmood. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var resetEmailTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func resetPasswordClicked(_ sender: Any) {
       guard  let email = resetEmailTxt.text , email.isNotEmpty
        else {
            
            return
            
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error
            {
            }
            self.dismiss(animated: true, completion: nil)
    }
    

}
    @IBAction func cancelBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
