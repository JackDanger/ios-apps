//
//  ViewController.swift
//  Homepwner
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController, UITableViewDataSource {
    
    let itemStore = ItemStore()
    let lastRow = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UITableViewCell")
    
    // Init
    override init() {
        super.init(style: UITableViewStyle.Plain)
        navigationItem.title = "Homepwner"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action:Selector("addNewItem:"))
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
    }
    
    // UITableViewController
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.items.count + 1
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row != itemStore.items.count
    }
    
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        if proposedDestinationIndexPath.row == itemStore.items.count {
            return sourceIndexPath
        } else {
            return proposedDestinationIndexPath
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row != itemStore.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == itemStore.items.count {
            lastRow.textLabel?.text = "No more stuff"
            return lastRow
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
            
            let item = itemStore.items[indexPath.row]
            cell.textLabel?.text = item.description()
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            itemStore.removeItem(itemStore.items[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "fuck this row"
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        itemStore.moveItem(sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(DetailViewController(item: itemStore.items[indexPath.row], nibName: "DetailViewController", bundle: NSBundle.mainBundle()), animated: true)
    }
    
    
    // Outlets
    
    @IBAction func addNewItem(sender: AnyObject) {
        let lastRow = itemStore.items.count
        let item = itemStore.createItem()
        let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }
    
    
    // NSViewController protocol
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

