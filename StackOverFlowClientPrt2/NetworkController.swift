//
//  NetworkController.swift
//  StackOverFlowClientPrt2
//
//  Created by Victor  Adu on 7/29/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class NetworkController: NSObject {
    
    
    func stackURLData (){
        //setting up the NSURLRequest
        let request = NSURLRequest(URL: NSURL(string: "http://api.stackexchange.com//2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow"))
        
        //setting up the NSURLSEssion
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        // Or we can do: let session = NSURLSession.sharedSession()
        
        //using our session to create a data ask for JSON fetch
        let taskData = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error :NSError!) -> Void in
            
            if error {
                //do something for overall session error
                println("Error. Please ensure internet connection and try again")
            }
            else {
                //'switch' on various http response codes
                if let httpResponse = response as? NSHTTPURLResponse {
                    switch httpResponse.statusCode {
                        
                    case 200: // any request in the 200 is good
                        println("OK:. Request successful. Proceed")
                        //NSJSONSerialization converts and prepares our fetched data for us
                        var error : NSError?
                        let jsonStackOverflowData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
                        var jsonAnswers = jsonStackOverflowData["items"] as NSArray

                        
                    case 400: // any request in the 400s is bad
                        println("Bad: Bad Request. Error in fetching data")
                    case 401:
                        println("Unauthorized: Authentication is required")
                    case 403:
                        println("Forbidden: Request was valid, but server refuses to respond")
                    case 404:
                        println("Not found: Requested resource not found")
                    case 429:
                        println("Too Many Requests: Rate limited")
                    case 500: // any request in the 500 is worse
                        println("Error in fetching data")
                        
                    default://alert user of error
                        println("Server Error. Try again next time")
                        
                      
                    }
                }
            }
            
            })
        taskData.resume()

    }
}
