//
//  Checklist.swift
//  Checklists
//
//  Created by 캡디 on 14/04/2019.
//  Copyright © 2019 hongjehong. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
