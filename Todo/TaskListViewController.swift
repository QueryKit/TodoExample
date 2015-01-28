//
//  ViewController.swift
//  Todo
//
//  Created by Kyle Fuller on 28/01/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import UIKit
import KFData
import QueryKit

class TaskListViewController: KFDataTableViewController {
  var dataStore:KFDataStore!

  var querySet:QuerySet<Task>! {
    didSet {
      if let querySet = querySet {
        setManagedObjectContext(querySet.context, fetchRequest: querySet.fetchRequest, sectionNameKeyPath: nil, cacheName: nil)
      } else {
        setManagedObjectContext(nil, fetchRequest: nil, sectionNameKeyPath: nil, cacheName: nil)
      }
    }
  }

  var context:NSManagedObjectContext? {
    return querySet.context
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    dataStore = KFDataStore.standardLocalDataStore(nil)
    let context = dataStore.managedObjectContext()
    querySet = Task.queryset(context).orderBy(Task.attributes.createdAt.descending())

    if let count = querySet.count() {
      if count == 0 {
        createTask("Hit add to create your first task.")
      }
    }
  }

  func createTask(name:String) {
    let task = Task(managedObjectContext: context)
    task.name = name
    task.createdAt = NSDate()
    context?.save(nil)
  }

  // MARK: UITableViewDataSource

  override func tableView(tableView: UITableView!, cellForManagedObject managedObject: NSManagedObject!, atIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    let task = managedObject as Task
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
    cell.textLabel?.text = task.name
    cell.accessoryType = task.complete!.boolValue ? .Checkmark : .None
    return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let task = dataSource.objectAtIndexPath(indexPath) as Task
    task.complete = !task.complete!.boolValue
  }

  // MARK: Actions

  @IBAction func handleCreate() {
    let alertController = UIAlertController(title: "Create Task", message: nil, preferredStyle: .Alert)
    alertController.addTextFieldWithConfigurationHandler { textField in }
    alertController.addAction(UIAlertAction(title: "Add", style: .Default) { _ in
      let textField = alertController.textFields![0] as UITextField
      if !textField.text.isEmpty {
        self.createTask(textField.text)
      }
    })
    alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    presentViewController(alertController, animated: true, completion: nil)
  }
}
