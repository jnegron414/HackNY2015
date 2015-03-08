//
//  MessageBoard.swift
//  Tinder
//
//  Created by Jonathan Negron on 3/8/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class MessageBoard: UIViewController, UITableViewDelegate {

    var messageBoard = [String]()
    
    @IBOutlet weak var tableViewMessageBoard: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("messageBoard") != nil {
            //to check if we have any data stored in the app already, if not we will have an error.
            
            messageBoard = NSUserDefaults.standardUserDefaults().objectForKey("messageBoard") as [String] //any data put into app will be saved and shown again each time the app loads.
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageBoard.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell") //using our prototype cell as the placeholder for user entry
        
        cell.textLabel?.text = messageBoard[indexPath.row] //the text in the "cell" is based off the item in the array for that row
        
        return cell
        
    }
    
    
    
}
