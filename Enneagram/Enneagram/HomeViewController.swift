//
//  HomeViewController.swift
//  Enneagram
//
//  Created by Jack Danger on 12/11/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "HomeView", bundle: nibBundleOrNil)
    }
    
    @IBAction func startTest(sender: UIButton) {
        navigationController?.pushViewController(QuizViewController(), animated: true)
        println("what?")
    }
    
}
