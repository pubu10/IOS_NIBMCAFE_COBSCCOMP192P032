//
//  CreateAccountViewController.swift
//  IOSApp
//
//  Created by pubudu tharuka on 2021-03-07.
//

import UIKit

class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCrateAccount(_ sender: Any) {
        //https://www.tutorialspoint.com/generic-way-to-validate-textfield-inputs-in-swift
        let _validation = Validation()
        
        
        guard let name = txtUserName.text, let email = txtEmail.text, let password = txtPassword.text,
              let phone = txtAddress.text else {
                 return
              }
        
              let isValidateName = _validation.validateName(name: name)
              if (isValidateName == false) {
                 print("Incorrect Name")
                 //return
              }
              let isValidateEmail = _validation.validateEmailId(emailID: email)
              if (isValidateEmail == false) {
                 print("Incorrect Email")
                // return
              }
              let isValidatePass = _validation.validatePassword(password: password)
              if (isValidatePass == false) {
                 print("Incorrect Pass")
                // return
              }
              let isValidatePhone = _validation.validaPhoneNumber(phoneNumber: phone)
              if (isValidatePhone == false) {
                 print("Incorrect Phone")
                 //return
              }
              if (isValidateName == true || isValidateEmail == true || isValidatePass == true || isValidatePhone == true) {
                 print("All fields are correct")
              }
       
        var msg : String
        let oUser = UserModel()
        let oCustomerBL = CustomerBL()
        
        oUser.Name = txtUserName.text!
        oUser.Email = txtEmail.text!
        oUser.Password = txtPassword.text!
        oUser.address = txtAddress.text!
        msg = oCustomerBL.CreateCustomerAccount(oModel: oUser) ? "Registration Complete" : "Try Again"
        
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
    }
}
