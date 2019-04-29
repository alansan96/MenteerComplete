//
//  LoginRegisterViewController.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import Firebase

class LoginRegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var roleTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func loginOrRegisterAction(_ sender: Any) {
        
        switch (sender as AnyObject).tag {
        case 1:
            print("sign in")
            //queryData()
            signIn(email: usernameTextField.text!, password: passwordTextField.text!)
        case 2:
            print("sign up")
            let bool = validateFormatRegister()
            if bool == true{
                createUser()
            }
        default:
            print("other")
        }
    }
    
    
    func createUser(){
        
        let userDB = Database.database().reference().child("User")
        
        let messageDictionary : NSDictionary = ["name" : nameTextField.text!, "username" : usernameTextField.text!, "password" : passwordTextField.text!, "role" : roleTextField.text!]
        
        print(usernameTextField.text!)
        
        
        
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                
            }
            else {
                // success
                userDB.child(Auth.auth().currentUser!.uid).setValue(messageDictionary) {
                    (error, ref) in
                    if error != nil {
                        print(error!)
                    }
                    else {
                        print("Message saved successfully!")
                    }
                    
                }
            }
        }
        
        
    }
    
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else {
                self.performSegue(withIdentifier: "seguee", sender: self)
            }
        }
        
    }
    
    func validateFormatRegister() -> Bool{
        let  check = isValidEmail(testStr: usernameTextField!.text!)
        
        if usernameTextField.text == "" {
            print("insert username")
        }else if nameTextField.text == ""{
            print("insert name")
        }else if passwordTextField.text == "" {
            print("insert password")
        }else if passwordTextField.text!.count < 6{
            print("password length should more than 6")
        }else if check == false{
            print("badly formatted email")
        }
            
        else {
            return true
        }
        
        return false
        
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
    
    
    
    
    
    

}
