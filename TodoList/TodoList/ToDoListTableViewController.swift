//
//  ToDoListTableViewController.swift
//  TodoList
//
//  Created by Colby on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

@objc(ToDoListTableViewController)class ToDoListTableViewController: UITableViewController {
    
    var items = [ToDoItem]()
    @IBOutlet weak var progressButton: UIBarButtonItem!
    
    func loadInitialData() {
        let item1 = ToDoItem(name: "Add my first item")
        self.items.append(item1)
    }
    
    func completedCount() -> Int {
        var ret = 0
        for item: ToDoItem in self.items {
            if item.completed {
                ret += 1
            }
        }
        return ret
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.progressButton {
            return
        } else {
            let vc: ProgressViewController = segue.destinationViewController as! ProgressViewController
            var completedCount = 0
            for obj in self.items {
                if obj.completed {
                    let interval = NSDate().timeIntervalSinceDate(obj.completionDate!)
                    if Int(interval) / 3600 < 24 {
                        completedCount += 1
                    }
                }
            }
            vc.count = completedCount
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId: NSString = "ListPrototypeCell"
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellId as String)! as UITableViewCell

        // Configure the cell...
        let todoItem: ToDoItem = self.items[indexPath.row]
        cell.textLabel!.text = todoItem.name as String
        if todoItem.completed {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let tappedItem: ToDoItem = self.items[indexPath.row]
        
        tappedItem.completed = !tappedItem.completed
        if tappedItem.completed {
            tappedItem.completionDate = NSDate()
        }
        tableView.reloadData()
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        let source: AddToDoViewController = segue.sourceViewController as! AddToDoViewController
        let item: ToDoItem? = source.toDoItem
        
        if item != nil {
            self.items.append(item!)
            self.tableView.reloadData()
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
