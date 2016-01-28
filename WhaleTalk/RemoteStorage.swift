//
//  RemoteStorage.swift
//  WhaleTalk
//
//  Created by Joshua Kuehn on 1/26/16.
//  Copyright © 2016 Kuehn LLC. All rights reserved.
//

import Foundation
import Parse
import Bolts
import CoreData

//We have to subclass RemoteStorage to NSObject b/c it allows us to use NSNotificationCenter
class RemoteStorage: NSObject {
    
    static func setup() {
        Parse.enableLocalDatastore()
        
        Parse.setApplicationId("69zPA5j6mPLPJyhVfHXIK9w9KM9aLSu52WAqG3s9", clientKey: "XPR5IXhximd3siaUSgT4O8vIO7wVLF6OtZydYUf0")
    }
    
    func hasAuth() -> Bool {
        
        return PFUser.currentUser() != nil
    }
    
    func signUp(phoneNumber:String, success: ()->(), error errorCallBack: (String) ->()) {
        let user = PFUser()
        user.username = phoneNumber
        user.password = "password"
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error, errorString = error.userInfo["error"] as? String {
                errorCallBack(errorString)
            } else {
                success()
            }
        }
    }
    
    //Listening to context allows us to modularize Parse so that no other VC knows about it
    func startSyncing(context: NSManagedObjectContext) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("contextSaved:"), name: NSManagedObjectContextDidSaveNotification, object: context)
    }
    
    
}
