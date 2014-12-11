//
//  Item.swift
//  Homepwner
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import Foundation


func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Item : Hashable {
    
    class Rand {
        class var letter : String {
            return [Int](0x41...0x5A).map({ String(UnicodeScalar($0)) })[random() % 26]
        }

        class var digit : Int {
            return [Int](0...9)[random() % 10]
        }
        
        class var adjective : String {
            return ["Dusty", "Lazy", "Awful"][random() % 3]
        }
        
        class var name : String {
            return ["Muffin", "Shiner", "Noggin"][random() % 3]
        }
    }

    var name: String
    var valueInDollars: Int
    var serialNumber: String
    var dateCreated: NSDate
    let uuid: NSUUID
    
    init(name theName: String, valueInDollars theValueInDollars: Int, serialNumber theSerialNumber: String) {
            name = theName
            dateCreated = NSDate()
            valueInDollars = theValueInDollars
            serialNumber = theSerialNumber
            uuid = NSUUID()
    }
    
    // MARK: Hashable
    var hashValue : Int {
        get {
            return uuid.hashValue
        }
    }
    
    class func randomItem() -> Item {
        let name = "\(Rand.adjective) \(Rand.name)"
        let valueInDollars = random() % 100
        let serialNumber = "\(Rand.letter)\(Rand.digit)\(Rand.digit)\(Rand.letter)\(Rand.digit)"
        return Item(name: name, valueInDollars: valueInDollars, serialNumber: serialNumber)
    }
    
    func description() -> String {
        return "\(name) (\(serialNumber)): Worth $\(valueInDollars), recorded on \(dateCreated)"
    }
}