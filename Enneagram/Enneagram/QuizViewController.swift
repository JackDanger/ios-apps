//
//  QuizViewController.swift
//  Enneagram
//
//  Created by Jack Danger on 12/11/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: NSLayoutConstraint!
    @IBOutlet weak var answerTable: UITableView!
    
    let dataSource = QuizData()
    
    override init() {
        super.init(nibName: "QuizView", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        answerTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    // MARK: QuizData (TableView)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
