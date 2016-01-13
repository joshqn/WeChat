//
//  Message+CoreDataProperties.swift
//  WhaleTalk
//
//  Created by Joshua Kuehn on 1/12/16.
//  Copyright © 2016 Kuehn LLC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Message {

    @NSManaged var text: String?
    @NSManaged var incoming: NSNumber?
    @NSManaged var timestamp: NSDate?

}
