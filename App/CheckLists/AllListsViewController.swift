//
//  AllListsViewController.swift
//  CheckLists
//
//  Created by yuheni on 30.11.17.
//  Copyright © 2017 yauheni. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate, UINavigationControllerDelegate {
    
    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        let checklist = dataModel.lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        let count = checklist.countUncheckedItems()
        if checklist.items.count == 0 {
            cell.detailTextLabel!.text = "(Нет задач)"
        } else if count == 0 {
            cell.detailTextLabel!.text = "Все выполнено!"
        } else {
            cell.detailTextLabel!.text = "\(count) Осталось"
        }
        cell.imageView!.image = UIImage(named: checklist.iconName)
        return cell
    }
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        dataModel.indexOfSelectedCheckList = indexPath.row
        let checklist = dataModel.lists[indexPath.row]
        performSegue(withIdentifier: "ShowCheckList", sender: checklist)
    }
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCellEditingStyle,forRowAt indexPath: IndexPath) {
        dataModel.lists.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    override func tableView(_ tableView: UITableView,accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let navigationController = storyboard!.instantiateViewController(
            withIdentifier: "ListDetailNavigationController") as! UINavigationController
        let controller = navigationController.topViewController as! ListDetailViewController
        controller.delegate = self
        let checklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = checklist
        present(navigationController, animated: true, completion: nil)
    }
    
    func makeCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCheckList" {
            let controller = segue.destination as! CheckListViewController
            controller.checklist = sender as! CheckList
        } else if segue.identifier == "AddCheckList" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ListDetailViewController
            controller.delegate = self
            controller.checklistToEdit = nil
        }
    }
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    func listDetailViewController(_ controller: ListDetailViewController,didFinishAdding checklist: CheckList) {
        dataModel.lists.append(checklist)
        dataModel.sortCheckLists()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func listDetailViewController(_ controller: ListDetailViewController,didFinishEditing checklist: CheckList) {
        dataModel.sortCheckLists()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController === self {
            dataModel.indexOfSelectedCheckList = -1
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
         let index = dataModel.indexOfSelectedCheckList
        if index >= 0 && index < dataModel.lists.count {
            let checklist = dataModel.lists[index]
            performSegue(withIdentifier: "ShowCheckList", sender: checklist)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
