//: Playground - noun: a place where people can play

import Foundation

let url = NSURL(string: "https://www.google.de")
var result: NSURLResponse?

let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in

    // nothing to do here since there is no space to display any feedback
    // trouble shooting should be done using the main app/phone

    result = response
   }

task.resume()
print(result)


