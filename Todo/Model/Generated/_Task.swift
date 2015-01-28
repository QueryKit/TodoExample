// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Task.swift instead.

import CoreData
import QueryKit

@objc
class _Task: NSManagedObject {

    class func queryset(context:NSManagedObjectContext) -> QuerySet<Task> {
        return QuerySet<Task>(context, entityName)
    }

    struct Attributes {

        var complete:Attribute<NSNumber> {
            return Attribute<NSNumber>("complete")
        }
        var createdAt:Attribute<NSDate?> {
            return Attribute<NSDate?>("createdAt")
        }
        var name:Attribute<String?> {
            return Attribute<String?>("name")
        }

    }

    class var attributes:Attributes {
        return Attributes()
    }

    // MARK: - Class methods

    class var entityName:String {
        return "Task"
    }

    class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName, inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Task.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var complete: NSNumber?

    // func validateComplete(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var createdAt: NSDate?

    // func validateCreatedAt(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var name: String?

    // func validateName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

}

