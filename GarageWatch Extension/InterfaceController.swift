//
//  InterfaceController.swift
//  GarageWatch Extension
//
//  Created by Dirk Gerretz on 01/01/16.
//  Copyright © 2016 [code2app];. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // Mark: - Action
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


    // Mark: - Action
    @IBAction func garageDoor(sender: AnyObject) {

        let url = NSURL(string: "http://192.168.178.42/garage.php")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in

            // nothing to do here since there is no space to display any feedback
            // trouble shooting should be done using the main app/phone
        }
        
        task.resume()
    }


}
