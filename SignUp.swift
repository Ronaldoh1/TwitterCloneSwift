//
//  SignUp.swift
//  InTown
//
//  Created by Ronald Hernandez on 9/2/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

import UIKit

class SignUp: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let ref = Firebase(url: "https://intown.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)
    }

    

@IBAction func onSignUpButtonTapped(sender: UIButton) {




//    self.root .createUser("bobtony@example.com", password: "correcthorsebatterystaple",
//        withValueCompletionBlock: { error, result in
//
//            if error != nil {
//                // There was an error creating the account
//            } else {
//                let uid = result["uid"] as? String
//                println("Successfully created user account with uid: \(uid)")
//            }
//    })


 }

@IBAction func onTermAndConditionsButtonTapped(sender: UIButton) {





    }


    @IBAction func onCancelButtonTapped(sender: UIButton) {

        self.dismissViewControllerAnimated(true, completion: nil)
    }


func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }


 override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

        self.emailTextField.resignFirstResponder()
        self.passwordTextfield.resignFirstResponder()
        self.usernameTextField.resignFirstResponder()
        self.view.endEditing(true)
    }



}
