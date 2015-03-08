//
//  AddNewMessage.swift
//  Tinder
//
//  Created by Jonathan Negron on 3/8/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class AddNewMessage: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        var user = PFUser.currentUser()
        
        user["latest"] = textView.text
        
        var latest: NSString = user["latest"] as NSString
        
        user.save()
        
        messageBoard.append(latest) //adds user entry into array
        
        textView.text = "" //resets textField
        
        self.performSegueWithIdentifier("addNewItem", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
