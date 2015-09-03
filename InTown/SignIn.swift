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

    
let rootRef = Firebase(url: "https://intown.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)
    }

    @IBAction func onSignInButtonTapped(sender: UIButton) {

        var error:NSString = ""
        var titleError:NSString = ""

        if self.emailTextField.text == "" || self.passwordTextField.text == ""{
            titleError = "Try Again"

            error = "All fields are required!"

            self.displayMessage(titleError, message: error)


        }else{

            rootRef.authUser(self.emailTextField.text, password: self.passwordTextField.text, withCompletionBlock: { (error, authData) -> Void in

                if error != nil {
                    println(error)
                    println("There is an error with the given informatin")

                    self.displayMessage("Please Try again", message: "There was an error with the information provided")

                }else{

                    //self.performSegueWithIdentifier("loginAndSignupComplete" , sender: self)

                    println("login success")
                }
            })

        }


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


    func displayMessage(title: NSString, message:NSString){

        var alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.Alert)

        alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

    }

}
