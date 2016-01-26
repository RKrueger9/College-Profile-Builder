//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by RKrueger on 1/25/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeTextField.text = college.name
        stateTextField.text = college.state
        enrollmentTextField.text = String(college.population)
        imageView.image = college.image
    }
    
    func resignAllFirstResponders()
    {
        collegeTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        enrollmentTextField.resignFirstResponder()
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject)
    {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(enrollmentTextField.text!)!
        resignAllFirstResponders()
        
    }
    
}
