// This is a generated file from QueryKit.
// https://github.com/QueryKit/querykit-cli

import QueryKit

/// Extension to Task providing an QueryKit attribute descriptions.
extension Task {
  static var createdAt:Attribute<NSDate> { return Attribute("createdAt") }
  static var name:Attribute<NSString> { return Attribute("name") }
  static var complete:Attribute<NSNumber> { return Attribute("complete") }

  class func queryset(context:NSManagedObjectContext) -> QuerySet<Task> {
    return QuerySet(context, "Task")
  }
}

extension Attribute where AttributeType: Task {
  var createdAt:Attribute<NSDate> { return attribute(AttributeType.createdAt) }
  var name:Attribute<NSString> { return attribute(AttributeType.name) }
  var complete:Attribute<NSNumber> { return attribute(AttributeType.complete) }
}

