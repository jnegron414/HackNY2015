//
//  MessageBoard.swift
//  Tinder
//
//  Created by Jonathan Negron on 3/8/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

var messageBoard = [String]()

class MessageBoard: UIViewController, UITableViewDelegate {
    
    var users = [""]
    
    @IBOutlet weak var tableViewMessageBoard: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    var query = PFUser.query()
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            
            self.users.removeAll(keepCapacity: true)
         
            for object in objects {
                
                var user:PFUser = object as PFUser
                
                self.users.append(user.latest)
                
                println("User is " + user.latest)
                
                
            }
        }
        
    )}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageBoard.count
        
    }
    
    //method is called whenever a user trys to edit an item in the table
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            //if user atttempts to delete (swipe to the left) an item this runs
            
            messageBoard.removeAtIndex(indexPath.row) //removes the item from the array at the specified index
            
            NSUserDefaults.standardUserDefaults().setObject(messageBoard, forKey: "messageBoard") //updates both arrays the saved and present versions
            
            tableViewMessageBoard.reloadData() //reloads table
            
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
           //using our prototype cell as the placeholder for user entry
        
        cell.textLabel?.text = messageBoard[indexPath.row] //the text in the "cell" is based off the item in the array for that row
        
        return cell
        
    }
    
    //function to reset text Field when return is pressed
    override func viewDidAppear(animated: Bool) {
        
        tableViewMessageBoard.reloadData()
        
    }
    
    
}

