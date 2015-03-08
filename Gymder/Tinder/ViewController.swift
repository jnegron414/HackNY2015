//
//  ViewController.swift
//  Tinder
//
//  Created by Jonathan Negron on 03/07/2015.
//  Copyright (c) 2014 JnegsWeMobbin. All rights reserved.
//
// Facebook Login code originally by Rob Percival 

import UIKit

class ViewController: UIViewController {
                            
    /** When button is pressed Log in process is activated */
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func loginButton(sender: AnyObject) {
        
        var permissions = ["public_profile"]
        
        // Update - added , block:
        
        PFFacebookUtils.logInWithPermissions(permissions, block: {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
                self.errorMessage.text = "Login was unsuccessful."
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                
                self.performSegueWithIdentifier("signUp", sender: self)
                
            } else {
                NSLog("User logged in through Facebook!")
                
                self.performSegueWithIdentifier("userValid", sender: self)
                
            }
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            
            self.performSegueWithIdentifier("userValid", sender: self)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if PFUser.currentUser() != nil
        {
            println("User is logged in!")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

