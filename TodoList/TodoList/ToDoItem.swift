//
//  ToDoItem.swift
//  TodoList
//
//  Created by Colby on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var name: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate();
    var completionDate: NSDate?
    
    init(name:String) {
        self.name = name
    }
}
