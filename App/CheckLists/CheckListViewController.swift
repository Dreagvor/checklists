//
//  ViewController.swift
//  CheckLists
//
//  Created by yuheni on 06.11.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController, ItemDetailViewControllerDelegate {
  
    var checklist: CheckList!
    var items: [CheckListItem]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CheckListItem", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        saveCheckListItems()
    }
    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCellEditingStyle,forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        saveCheckListItems()
    }
    
    func configureCheckmark(for cell: UITableViewCell,
                            with item: CheckListItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configureText(for cell: UITableViewCell,
                       with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        super.init(coder: aDecoder)
        loadCheckListItems()
    }
   
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem){
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
        saveCheckListItems()
    }
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
        saveCheckListItems()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.itemToEdit = items[indexPath.row]
                
            }
        }
    }
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("CheckLists.plist")
    }
    func saveCheckListItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(items, forKey: "CheckListItems")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    func loadCheckListItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            items = unarchiver.decodeObject(forKey: "CheckListItems") as! [CheckListItem]
            unarchiver.finishDecoding()
        }
    }
}

