//
//  Task.swift
//  Todo
//
//  Created by Kyle Fuller on 28/01/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import CoreData

@objc(Task)
class Task: NSManagedObject {
  class func create(managedObjectContext:NSManagedObjectContext) -> Task {
    let entityDescription = NSEntityDescription.entityForName("Task", inManagedObjectContext: managedObjectContext)
    return Task(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
  }
}
