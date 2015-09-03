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
    let rootRef = Firebase(url: "https://intown.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)
    }

    

@IBAction func onSignUpButtonTapped(sender: UIButton) {


    var error:NSString = ""
    var titleError:NSString = ""

    if self.emailTextField.text == "" || self.passwordTextfield.text == "" {


        titleError = "Try Again"

        error = "All fields are required!"

        self.displayMessage(titleError, message: error)

    }else{


        //first we need to create an account for the user.
        self.rootRef.createUser(self.emailTextField.text, password: self.passwordTextfield.text, withValueCompletionBlock: { (error, retult) -> Void in



            if error != nil{


                self.displayMessage("Try again", message: "There was an error signing up")

            }else{

                //login the user
                self.rootRef.authUser(self.emailTextField.text, password: self.passwordTextfield.text, withCompletionBlock: { (error, authData) -> Void in


                    if error != nil {

                        self.displayMessage("Cannot Login", message: "Please try to login again")

                    }else{

                        //create a userid for all new users - addd additional properties as needed. 

                        var userId = authData.uid
                        let newUser = ["provider": authData.provider,
                            "email" : authData.providerData["email"] as? NSString as! String,
                            "post": "",
                            "username": self.usernameTextField.text]

                        let firstPost = [
                            "\(NSDate())": "Hi Everyone, I am In Town!!!!"]


                        self.rootRef.childByAppendingPath("Users").childByAppendingPath(authData.uid).setValue(newUser)

                        self.rootRef.childByAppendingPath("Users/\(authData.uid)/Posts").setValue(firstPost)


                        //once all the user has been created and logged in, we can allow him to see the application

                        var storyboard = UIStoryboard(name: "Feed", bundle: nil)
                        var controller = storyboard.instantiateViewControllerWithIdentifier("FeedNavVC") as! UINavigationController
                        self.presentViewController(controller, animated:true, completion: nil)
                        

                    }



                })
                
                
                
            }
            
            
            
            
            
        })






    }


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

    func displayMessage(title: NSString, message:NSString){

        var alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.Alert)

        alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}
