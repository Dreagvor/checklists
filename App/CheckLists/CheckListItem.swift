//
//  CheckListItem.swift
//  CheckLists
//
//  Created by yuheni on 24.11.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import Foundation

class CheckListItem{
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
