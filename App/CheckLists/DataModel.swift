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
    var indexOfSelectedCheckList: Int {
        get {
            return UserDefaults.standard.integer(forKey: "CheckListIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "CheckListIndex")
        }
    }
    
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
        registerDefaults()
        handleFirstTime()
        
    }
    func registerDefaults() {
        let dictionary: [String: Any] = [ "CheckListIndex": -1, "FirstTime": true ]
        UserDefaults.standard.register(defaults: dictionary)
    }
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        if firstTime {
            let checklist = CheckList(name: "List")
            lists.append(checklist)
            indexOfSelectedCheckList = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
}
