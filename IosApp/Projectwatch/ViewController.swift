//
//  ViewController.swift
//  Projectwatch
//
//  Created by Chanokchon on 12/7/2562 BE.
//  Copyright © 2562 Chanokchon. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    var check = true
    var gender = "female"
    var activityIndicator = UIActivityIndicatorView()
    func alert(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "0k", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var femaleText: UILabel!
    @IBOutlet weak var maleText: UILabel!
    @IBOutlet weak var blaceletTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginHiddenText: UIButton!
    @IBOutlet weak var loginText: UIButton!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var signupText: UIButton!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var swtichValue: UISwitch!
    @IBOutlet weak var phoneText: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var blaceidText: UILabel!
    @IBOutlet weak var passwordText: UILabel!
    @IBAction func switchTapped(_ sender: Any) {
        if swtichValue.isOn == true {
            gender = "female"
        } else {
            gender = "male"
        }
    }
    @IBAction func signupTapped(_ sender: Any) {
        if usernameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || phoneTextField.text == "" || blaceletTextField.text == ""  {
            alert(title: "Sign up Failed", message: "Missing requirement")
        } else if emailTextField.text?.contains("@") == false {
            alert(title: "Sign up Failed", message: "Please enter correct email")
        } else {
            let user = PFUser()
            user.username = blaceletTextField.text
            user.email = emailTextField.text
            user.password = passwordTextField.text
            user["gender"] = gender
            user["phone"] = phoneTextField.text
            user["name"] = usernameTextField.text
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.alert(title: "Sign up Failed", message: error.debugDescription)
                } else {
                    self.performSegue(withIdentifier: "toUser", sender: self)
                }
            }
        }
    }
    @IBAction func loginHiddenTapped(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: emailTextField.text!) { (user, error) in
            if error != nil {
                self.alert(title: "Log in Failed", message: error.debugDescription)
            } else {
                self.performSegue(withIdentifier: "toUser", sender: self)
            }
        }
        
        
    }
    @IBAction func loginTapped(_ sender: Any) {
        if check == true {
            usernameTextField.text = ""
            emailTextField.text = ""
            usernameText.text = "Bracelet ID"
            emailText.text = "Password"
            passwordText.alpha = 0
            phoneText.alpha = 0
            blaceidText.alpha = 0
            maleText.alpha = 0
            femaleText.alpha = 0
            swtichValue.alpha = 0
            passwordTextField.alpha = 0
            phoneTextField.alpha = 0
            blaceletTextField.alpha = 0
            signupText.alpha = 0
            loginText.center = CGPoint(x: loginText.center.x, y: 330)
            detailText.center = CGPoint(x: detailText.center.x, y: 330)
            emailTextField.isSecureTextEntry = true
            loginHiddenText.alpha = 1
            detailText.text = "Don't have account ->"
            loginText.setTitle("Sign up", for: [])
            check = false
        } else {
            usernameText.text = "Username"
            emailText.text = "E mail"
            passwordText.alpha = 1
            phoneText.alpha = 1
            blaceidText.alpha = 1
            maleText.alpha = 1
            femaleText.alpha = 1
            swtichValue.alpha = 1
            passwordTextField.alpha = 1
            phoneTextField.alpha = 1
            blaceletTextField.alpha = 1
            signupText.alpha = 1
            loginText.center = CGPoint(x: loginText.center.x, y: 600)
            detailText.center = CGPoint(x: detailText.center.x, y: 600)
            emailTextField.isSecureTextEntry = false
            loginHiddenText.alpha = 0
            
            detailText.text = "Already have account ->"
            loginText.setTitle("Log in", for: [])
            check = true
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current() != nil {
            performSegue(withIdentifier: "toUser", sender: self)
        }
    }
    override func viewDidLoad() {
        loginHiddenText.alpha = 0
        gender = "female"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

