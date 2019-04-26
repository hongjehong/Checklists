//
//  Checklist.swift
//  Checklists
//
//  Created by 캡디 on 14/04/2019.
//  Copyright © 2019 hongjehong. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name=""
    /* each Checklist object has Checklist item */
    var items = [ChecklistItem]()
    init(name: String) {
        self.name = name
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
