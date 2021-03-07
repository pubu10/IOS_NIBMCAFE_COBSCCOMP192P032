//
//  LoginViewController.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-07.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "CreateAccountView") as! CreateAccountViewController
       self.present(vc,animated: true,completion: nil)

        print("tapped button")
    }
    
}
