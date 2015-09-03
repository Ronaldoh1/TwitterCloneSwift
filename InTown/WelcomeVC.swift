//
//  WelcomeVC.swift
//  InTown
//
//  Created by Ronald Hernandez on 9/2/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 1.0/255.0, alpha: 1.0)

    }




@IBAction func onSignInButtonTapped(sender: UIButton) {

    var storyboard = UIStoryboard(name: "SignIn", bundle: nil)
    var controller = storyboard.instantiateViewControllerWithIdentifier("SignInVC") as! UIViewController
    self.presentViewController(controller, animated:true, completion: nil)


}

@IBAction func onSignUpButtonTapped(sender: UIButton) {





    }

}
