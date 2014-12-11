//
//  DrawViewController.swift
//  TouchTracker
//
//  Created by Jack Danger on 12/10/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    override func loadView() {
        view = DrawView(frame: CGRect.zeroRect)
    }
}

