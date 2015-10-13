//
//  ProgressViewController.swift
//  TodoList
//
//  Created by Colby on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var doneCount: UILabel!
    var count: Int = 0
    
    override func viewDidLoad() {
        doneCount.text = NSString(format: "%d", count) as String
    }
    
    
}
