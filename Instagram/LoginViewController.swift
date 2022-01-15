//
//  LoginViewController.swift
//  Instagram
//
//  Created by Astronaut Elvis on 1/14/22.
//

import UIKit
import Parse
import Toast_Swift

class LoginViewController: UIViewController {

    // Login
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // Sign Up
    @IBOutlet weak var newUsernameTextfield: UITextField!
    @IBOutlet weak var newPasswordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextfield.text!
        let password = passwordTextfield.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            } else {
                self.view.makeToast("There was a probelm with the login credentials.", duration: 6.0, position: .bottom)
            }
        }
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = newUsernameTextfield.text
        user.password = newPasswordTextfield.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                self.view.makeToast("There was an error when attempting to sign up for a new account")
                print("Error \(error?.localizedDescription)")
            }
            
        }
    }
    
    
    
}
