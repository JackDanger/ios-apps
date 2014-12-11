//
//  ImageStore.swift
//  Homepwner
//
//  Created by Jack Danger on 12/10/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class ImageStore {
    
    var images: Dictionary<Item, UIImage>
    
    class var sharedStore: ImageStore {
        struct Static {
            static let instance : ImageStore = ImageStore();
        }
        return Static.instance;
    }
    
    init() {
        images = Dictionary<Item, UIImage>()
    }
    
    func remove(item: Item) {
        images.removeValueForKey(item)
    }
    
    subscript(item: Item) -> UIImage? {
        get {
            return images[item]
        }
        set(newImage) {
            images[item] = newImage
        }
    }
}