//
//  ViewController.swift
//  Checklists
//
//  Created by 캡디 on 12/04/2019.
//  Copyright © 2019 hongjehong. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Checklistitem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "Walk the dog"
        }
        else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        }
        else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS developement"
        }
        else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        }
        else if indexPath.row % 5 == 4 {
            label.text = "Eat ice cream"
        }
        return cell
    }


}

