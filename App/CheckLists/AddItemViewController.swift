//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by yuheni on 24.11.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView,willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
