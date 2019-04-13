//
//  Checklistitem.swift
//  Checklists
//
//  Created by 캡디 on 12/04/2019.
//  Copyright © 2019 hongjehong. All rights reserved.
//

import Foundation

class ChecklistItem:NSObject {
    var text = ""
    var checked = false
    /* For toggling */
    func toggleChecked() {
        checked = !checked
    }
}
