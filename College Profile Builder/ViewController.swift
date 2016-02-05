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
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    var colleges : [College] = [];
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "University of Illinois", state: "Illinois", population: 44087, image: UIImage(named: "University of Illinois")! , webPage: "http://illinois.edu"))
        colleges.append(College(name: "Northwestern", state: "Illinois", population: 20336, image: UIImage(named: "northwestern1")! , webPage: "http://www.northwestern.edu"))
        colleges.append(College(name: "University of Wisconson", state: "Wisconson", population: 43193, image: UIImage(named: "Wisconson")! , webPage : "http://www.wisc.edu"))
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath);
        cell.textLabel?.text = colleges[indexPath.row].name;
        return cell;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row);
            tableView.reloadData();
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
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
            self.colleges.append(College(name: collegesTextField.text!))
            self.tableView.reloadData() }
        alert.addAction(addAction);
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem)
    {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
}
    


