//
//  DrawView.swift
//  TouchTracker
//
//  Created by Jack Danger on 12/10/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var currentLines: Dictionary<UITouch, Line>
    var finishedLines: Dictionary<Line, Bool>
    var selectedLine: Line?
    
    override init(frame: CGRect) {
        finishedLines = Dictionary<Line, Bool>()
        currentLines = Dictionary<UITouch, Line>()
        super.init(frame: frame)
        backgroundColor = UIColor.grayColor()
        multipleTouchEnabled = true
        
        // Double tap
        let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTap:"))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delaysTouchesBegan = true
        addGestureRecognizer(doubleTap)
        
        // Single tap
        let tap = UITapGestureRecognizer(target: self, action: Selector("tap:"))
        tap.delaysTouchesBegan = true
        tap.requireGestureRecognizerToFail(doubleTap)
        addGestureRecognizer(tap)
    }
    
    required init(coder aDecoder: NSCoder) {
        finishedLines = Dictionary<Line, Bool>()
        currentLines = Dictionary<UITouch, Line>()
        super.init(coder: aDecoder)
    }
    
    
    // MARK: Gestures
    
    func doubleTap(gestureRecognizer: UIGestureRecognizer) {
        currentLines.removeAll(keepCapacity: true)
        finishedLines.removeAll(keepCapacity: true)
        setNeedsDisplay()
    }
    
    func tap(gestureRecognizer: UIGestureRecognizer) {
        let point = gestureRecognizer.locationInView(self)
        let menu = UIMenuController.sharedMenuController()
        
        if let line = lineAtPoint(point) {
            selectedLine = line
            println("%@", line)
            
            becomeFirstResponder()
            
            menu.menuItems = [UIMenuItem(title: "Delete", action: Selector("deleteLine:"))]
            menu.setTargetRect(CGRectMake(point.x, point.y, 2, 2), inView: self)
            menu.setMenuVisible(true, animated: true)
            
        } else {
            menu.setMenuVisible(false, animated: true)
        }
        setNeedsDisplay()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    func deleteLine(sender: AnyObject) {
        if selectedLine != nil {
            finishedLines.removeValueForKey(selectedLine!)
            UIMenuController.sharedMenuController().setMenuVisible(false, animated: true)
        }
        setNeedsDisplay()
    }
    
    // MARK: MATH
    
    func lineAtPoint(point: CGPoint) -> Line? {
        for line in finishedLines.keys {
            let start = line.begin!
            let end = line.end!
            for t in 0...20 {
                let x = start.x + (CGFloat(t) * 5) * (end.x - start.x)
                let y = start.y + (CGFloat(t) * 5) * (end.y - start.y)
                if hypot(x - point.x, y - point.y) < 30.0 {
                    return line
                }
            }
        }
        return nil
    }
    
    // MARK: Draw shit
    
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = kCGLineCapRound
        
        path.moveToPoint(line.begin!)
        path.addLineToPoint(line.end!)
        path.stroke()
    }
    
    override func drawRect(rect: CGRect) {
        UIColor.blackColor().set()
        for line in finishedLines.keys {
            strokeLine(line)
        }
        UIColor.redColor().set()
        for line in currentLines.values {
            strokeLine(line)
        }
        if selectedLine != nil {
            UIColor.greenColor().set()
            strokeLine(selectedLine!)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let line = Line()
            
            let location = touch.locationInView(self)
            
            line.begin = location
            line.end = location
            
            currentLines[touch as UITouch] = line
        }
        
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let location = touch.locationInView(self)
            if let line = currentLines[touch as UITouch] {
                line.end = location
            }
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            if let line = currentLines[touch as UITouch ] {
                finishedLines[line] = true
                currentLines.removeValueForKey(touch as UITouch )
            }
        }
        setNeedsDisplay()
    }
    
}
