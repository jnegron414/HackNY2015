//
//  SignUpPage.swift
//  Tinder
//
//  Created by Jonathan Negron on 3/7/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class SignUpPage: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var bioField: UITextView!
    
    @IBAction func saveChanges(sender: AnyObject) {
        
        var user = PFUser.currentUser()

        user["bio"] = bioField.text
        
        user.save()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var user = PFUser.currentUser()
        
        var FBSession = PFFacebookUtils.session()
        
        var accessToken = FBSession.accessTokenData.accessToken
        
        let url = NSURL(string: "https://graph.facebook.com/me/picture?type=large&return_ssl_resources=1&access_token=" + accessToken)
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
        response, data, error in
        
            let image = UIImage(data: data)

            self.profilePic.image = image
            
            user["image"] = data
            
            user.save()
            
            FBRequestConnection.startForMeWithCompletionHandler({
            connection, result, error in
                
                user["gender"] = result["gender"]
                
                user["name"] = result["name"]
            
                user.save()
                
            })
        
        })
        
        if user.isNew {
            
            self.bioField.text = ""
        }
            
        else{
            
        self.bioField.text = user["bio"] as NSString
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    func textViewShouldReturn(textField: UITextField) -> Bool {
        
        bioField.resignFirstResponder()
        
        return true
        
    }

    
}
