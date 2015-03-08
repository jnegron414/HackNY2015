//
//  messageView.swift
//  Tinder
//
//  Created by Jonathan Negron on 3/8/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class messageView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint: PFGeoPoint!, error: NSError!) -> Void in
            
            if error == nil {
                
                println(geopoint)
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
