//
//  ItemStore.swift
//  Homepwner
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import Foundation

class ItemStore {
    var items = [Item]();
    
    class var sharedStore: ItemStore {
        struct Static {
            static let instance : ItemStore = ItemStore();
        }
        return Static.instance;
    }
    
    func removeItem(item: Item) -> Bool {
        var removed = false
        for var i = 0; i < items.count; i++ {
            if items[i] === item {
                items.removeAtIndex(i)
                removed = true
                break
            }
        }
        return removed
        
    }
    
    func moveItem(from: Int, to: Int) {
        let item = items[from]
        items.removeAtIndex(from)
        items.insert(item, atIndex: to)
    }
    
    func createItem() -> Item {
        let item = Item.randomItem()
        items.append(item)
        return item
    }
}