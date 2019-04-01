//
//  ViewController.swift
//  EcommerceApp
//
//  Created by Qudsia Mehmood on 19/01/2019.
//  Copyright © 2019 Qudsia Mehmood. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    
    //Outlet
    
    @IBOutlet weak var loginOutletBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
       if let user = Auth.auth().currentUser
        {
            loginOutletBtn.title = "Logout"
        }
        else{
            loginOutletBtn.title = "Login"
        }
    }
    
    
    fileprivate func presentLoginController() {
        let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func loginOutBtn(_ sender: Any) {
        
//        try! Auth.auth().signOut()
        // when logedin
        if let user = Auth.auth().currentUser
        {
            do {
                try Auth.auth().signOut()
                presentLoginController()
            }
            catch
            {
                debugPrint(error.localizedDescription)
            }
        }
        else{
            presentLoginController()
        }
    }
    
}

