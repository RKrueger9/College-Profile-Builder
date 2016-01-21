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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath);
        cell.textLabel?.text = colleges[indexPath.row];
        return cell;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegesTextField = alert.textFields![0] as UITextField
            self.colleges.append(collegesTextField.text!)
            self.tableView.reloadData() }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
}
    


