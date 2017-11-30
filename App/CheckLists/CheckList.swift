//
//  CheckList.swift
//  CheckLists
//
//  Created by yuheni on 30.11.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import UIKit

class CheckList: NSObject, NSCoding {
    var name = ""
    var items = [CheckListItem]()
    init(name: String) {
        self.name = name
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [CheckListItem]
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
    }
}
