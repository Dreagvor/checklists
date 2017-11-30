//
//  DataModel.swift
//  CheckLists
//
//  Created by yuheni on 01.12.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [CheckList]()
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    func saveCheckLists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "CheckLists")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    func loadCheckLists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            lists = unarchiver.decodeObject(forKey: "CheckLists") as! [CheckList]
            unarchiver.finishDecoding()
        }
    }
    init() {
        loadCheckLists()
    }
}
