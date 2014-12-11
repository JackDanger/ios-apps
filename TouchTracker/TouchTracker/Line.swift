//
//  Line.swift
//  TouchTracker
//
//  Created by Jack Danger on 12/10/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

func ==(lhs: Line, rhs: Line) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Line : NSObject, Hashable {
    var begin: CGPoint?
    var end: CGPoint?
    let uuid: NSUUID
    
    override init() {
        uuid = NSUUID()
        super.init()
    }
    
    override var hashValue : Int {
        get {
            return uuid.hashValue
        }
    }
}
