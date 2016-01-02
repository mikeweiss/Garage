//
//  ViewController.swift
//  Garage
//
//  Created by Dirk Gerretz on 01/01/16.
//  Copyright © 2016 [code2app];. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Mark: - Properties
    @IBOutlet weak var result: UITextView!


    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Mark: - Action
    @IBAction func garageDoor(sender: AnyObject) {

        let url = NSURL(string: "http://192.168.178.42/garage.php")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in

            if let result = data {

                dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                    self.result.text = (NSString(data: result, encoding: NSUTF8StringEncoding)) as! String
                }
            }

            if let err = error {
                dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                    self.result.text = "An error ocurred: \n \(err)"
                    print(err)
                }
            }

        }
        
        task.resume()
    }
}

