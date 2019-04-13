//
//  ViewController.swift
//  Checklists
//
//  Created by 캡디 on 12/04/2019.
//  Copyright © 2019 hongjehong. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var items = [ChecklistItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
    }
    
    //
    /* For Checkmark */
    func configureCheckmark(for cell: UITableViewCell,
                            with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    /* Printing Label.text from item */
    func configureText(for cell: UITableViewCell,
                       with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /*
    @IBAction func addItem(){
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
 */
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Checklistitem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Mark:- Add Item ViewController Delegates
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    // Mark: -Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }

    //
    
    /*
     //
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
            label.text = "Learn iOS development"
        }
        else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        }
        else if indexPath.row % 5 == 4 {
            label.text = "Eat ice cream"
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
     //
    */

}

