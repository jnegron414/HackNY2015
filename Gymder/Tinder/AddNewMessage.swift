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
        
        user["Latest_entry"] = textView.text
        
        user.save()
        
        messageBoard.append(textView.text) //adds user entry into array
        
        textView.text = "" //resets textField
        
        NSUserDefaults.standardUserDefaults().setObject(messageBoard, forKey: "messageBoard")
        //updates NSUserDefaults every time a new entry is added.
        
        println(messageBoard)
        
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
