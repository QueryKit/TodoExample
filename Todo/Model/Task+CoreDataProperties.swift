//
//  Task+CoreDataProperties.swift
//  Todo
//
//  Created by Kyle Fuller on 08/09/2015.
//  Copyright © 2015 Cocode. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var complete: NSNumber?
    @NSManaged var createdAt: NSDate?
    @NSManaged var name: String?

}
