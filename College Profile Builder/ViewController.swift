//
//  ViewController.swift
//  College Profile Builder
//
//  Created by RKrueger on 1/20/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var colleges = ["University of Illinois" , "Northwestern" , "University of Wisconson"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

