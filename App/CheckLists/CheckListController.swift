//
//  ViewController.swift
//  CheckLists
//
//  Created by yuheni on 06.11.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var items: [CheckListItem]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell,
                            with item: CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell,
                       with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        let row0item = CheckListItem()
        row0item.text = "делать тритпо"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = CheckListItem()
        row1item.text = "купить хлеб"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = CheckListItem()
        row2item.text = "учить айос"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = CheckListItem()
        row3item.text = "сходить в зал"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = CheckListItem()
        row4item.text = "забрать посылку"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = CheckListItem()
        item.checked = false
        item.text = "Новый"
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }


}

