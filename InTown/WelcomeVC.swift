//
//  WelcomeVC.swift
//  InTown
//
//  Created by Ronald Hernandez on 9/2/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {


@IBOutlet weak var signInButton: UIButton!
@IBOutlet weak var signUpButton: UIButton!

let rootRef = Firebase(url: "https://intown.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()


        //Change the background to orange

        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)
        //Change the signin and sign up buttons and give a white border.

        self.signInButton.layer.borderWidth = 4.0
        self.signUpButton.layer.borderWidth = 4.0
        self.signInButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
}

    override func viewDidAppear(animated: Bool) {

        //check if the current user has already logged in. If so, then take him to the application.
        if self.rootRef.authData != nil {

            var storyboard = UIStoryboard(name: "Feed", bundle: nil)
            var controller = storyboard.instantiateViewControllerWithIdentifier("FeedNavVC") as! UINavigationController
            self.presentViewController(controller, animated:true, completion: nil)

        }



    }

@IBAction func onSignInButtonTapped(sender: UIButton) {

    var storyboard = UIStoryboard(name: "SignIn", bundle: nil)
    var controller = storyboard.instantiateViewControllerWithIdentifier("SignInVC") as! UIViewController
    self.presentViewController(controller, animated:true, completion: nil)


}

@IBAction func onSignUpButtonTapped(sender: UIButton) {




    var storyboard = UIStoryboard(name: "SignUp", bundle: nil)
    var controller = storyboard.instantiateViewControllerWithIdentifier("SignUpVC") as! UIViewController
    self.presentViewController(controller, animated:true, completion: nil)

    }

}
