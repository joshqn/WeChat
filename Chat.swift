//
//  Chat.swift
//  WhaleTalk
//
//  Created by Joshua Kuehn on 3/18/16.
//  Copyright © 2016 Kuehn LLC. All rights reserved.
//

import Foundation
import CoreData


class Chat: NSManagedObject {
  
  var lastMessage:Message? {
    let request = NSFetchRequest(entityName: "Message")
    request.predicate = NSPredicate(format: "chat = %@", self)
    request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
    request.fetchLimit = 1
    
    do {
      guard let results = try self.managedObjectContext?.executeFetchRequest(request) as? [Message] else { return nil }
      return results.first
    } catch {
      print("Error for Request")
    }
    
    return nil
  }
  
}
