//
//  AddToDoViewController.swift
//  TodoList
//
//  Created by Colby on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    var toDoItem: ToDoItem?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.doneButton {
            return
        }
        if self.textField.text!.utf16.count > 0 {
            self.toDoItem = ToDoItem(name: self.textField.text!)
        }
    }
}
