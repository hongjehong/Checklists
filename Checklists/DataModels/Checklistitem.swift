//
//  Checklistitem.swift
//  Checklists
//
//  Created by 캡디 on 12/04/2019.
//  Copyright © 2019 hongjehong. All rights reserved.
//

import Foundation

class ChecklistItem:NSObject, Codable {
    var text = ""
    var checked = false
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init(){
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    /* For toggling */
    func toggleChecked() {
        checked = !checked
    }
}
