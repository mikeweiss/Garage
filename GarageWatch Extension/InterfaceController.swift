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

    // Mark: - Properties
    @IBOutlet var doorButton: WKInterfaceButton!
    var doorTask: NSURLSessionDataTask?

    // availibility of the server will automatically also set 
    // button to enabled/disabled. Default is disabled
    var serverAvailable = false {
        didSet {

            switch (serverAvailable) {

            case false:
                doorButton.setEnabled(false)
                setButtonImage()

                //as "serverAvailable" is set in "checkServer()" this test 
                // gets executed until the the server is available
                checkServer()
                break;

            default:
                doorButton.setEnabled(true)
                setButtonImage()
                break;
            }
        }
    }

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

    override func didAppear() {

        //  deactivate button by default
        serverAvailable = false

    }

    func setButtonImage() {

        switch (serverAvailable) {

        case false:
            doorButton.setBackgroundImageNamed("garageIcon136gray.png")
            break

        default:
            doorButton.setBackgroundImageNamed("garageIcon136.png")
            break
        }

    }


    // Mark: - Action
    @IBAction func garageDoor(sender: AnyObject) {

        // out comment for testing
        let url = NSURL(string: "http://192.168.178.42/garage.php")

        // use this while testing
//        let url = NSURL(string: "https//www.google.de")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) in

            if let httpResponse = response as? NSHTTPURLResponse {
                print(httpResponse.statusCode)
            }

        })
        
        task.resume()

    }

    // Mark: - Check web server availability

    func checkServer() {

        // this methods perform a http request. The result being anything but 200 
        // means Server Not Available. Alter the target ser as appropriate

//        let url = NSURL(string: "http://192.168.178.42/garage.php")

        let url = NSURL(string: "http://192.168.178.42/test.php")

        let testTask = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) in

            if let httpResponse = response as? NSHTTPURLResponse {

                if (httpResponse.statusCode == 200) {
                    self.serverAvailable = true
                } else {
                    self.serverAvailable = false
                }
            }

        })

        testTask.resume()
    }

}
