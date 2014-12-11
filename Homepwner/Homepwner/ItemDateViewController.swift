//
//  ItemDateViewController.swift
//  Homepwner
//
//  Created by Jack Danger on 12/10/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class ItemDateViewController: UIViewController {
    var item: Item
    
    @IBOutlet var dateField: UIDatePicker?
    
    init(item anItem: Item, nibName nibNameOrNil: String, bundle nibBundleOrNil: NSBundle) {
        item = anItem
        super.init(nibName: "ItemDateViewController", bundle: NSBundle.mainBundle())
        navigationItem.title = "Date for \(item.name)"
    }
    
    override func viewWillAppear(animated: Bool) {
        dateField?.date = item.dateCreated
    }
    
    required init(coder aDecoder: NSCoder) {
        item = Item.randomItem()
        raise(1) // we've failed
        super.init()
    }
    
    // Outlets
    
    @IBAction func dateChanged(sender: AnyObject) {
        item.dateCreated = (sender as UIDatePicker).date
    }
}
