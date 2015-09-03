//
//  SignIn.swift
//  InTown
//
//  Created by Ronald Hernandez on 9/2/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

import UIKit

class SignIn: UIViewController {

@IBOutlet weak var passwordTextField: UITextField!
 @IBOutlet weak var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)
    }


    @IBAction func onSignUpButtonTapped(sender: UIButton) {

        var storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        var controller = storyboard.instantiateViewControllerWithIdentifier("SignUpVC") as! UIViewController
        self.presentViewController(controller, animated:true, completion: nil)

    }

    @IBAction func onForgotPasswordButtonTapped(sender: UIButton) {




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
        self.passwordTextField.resignFirstResponder()

        self.view.endEditing(true)
    }
}
