//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by RKrueger on 1/25/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController,SFSafariViewControllerDelegate
{
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webPageTextField: UITextField!
    
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeTextField.text = college.name
        stateTextField.text = college.state
        enrollmentTextField.text = String(college.population)
        imageView.image = college.image
        webPageTextField.text = college.webPage
        
    }
    
    func resignAllFirstResponders()
    {
        collegeTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        enrollmentTextField.resignFirstResponder()
        webPageTextField.resignFirstResponder()
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject)
    {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(enrollmentTextField.text!)!
        college.webPage = webPageTextField.text!
        resignAllFirstResponders()
        
    }
    
    @IBAction func toWebPageOnTap(sender: AnyObject)
    {
        let url = NSURL(string: college.webPage)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
}
