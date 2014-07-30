//
//  Answer.swift
//  StackOverFlowClientPrt2
//
//  Created by Victor  Adu on 7/29/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class Answer: NSObject {
    
    
    var title: String?
    var answerCount: Int?
    var questionID: Int?
    var isAnswered: Bool?
    var link : NSURL?
    var answerDate : NSDate?
    
    init(titleI:String, answerCountI:Int, questionIDI:Int)  {
    
        self.title = titleI
        self.answerCount = answerCountI
        self.questionID = questionIDI
       
    
    }
    
    class func answersFromJSONData(jsonStackOverflowData : NSArray) -> [Answer]{
        
        var answers = [Answer]()
        
        //Initializing our properties
        var ans = Answer(titleI: " ", answerCountI: 0, questionIDI: 0)
        
        for jsonAnswer : AnyObject in jsonStackOverflowData {
            ans.answerCount = jsonAnswer.objectForKey("answer_count") as? Int
            ans.questionID = jsonAnswer.objectForKey("question_id") as? Int
            ans.title = jsonAnswer.objectForKey("title") as? String
            ans.link = jsonAnswer.objectForKey("link") as? NSURL
            ans.answerDate = jsonAnswer.objectForKey("creation_date") as? NSDate
            
            if let user = jsonAnswer["owner"] as? NSDictionary {  //?????
                var userID = user["user_id"] as String
                var userName = user["display_name"] as String
                var link = user["link"] as NSURL
                var imageProfile = user["profile_image"] as UIImage
                
            }
            
            answers += ans
            
        }
        return answers
        
    }
}
