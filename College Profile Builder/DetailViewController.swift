//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by RKrueger on 1/25/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController,SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webPageTextField: UITextField!
    
    var college : College!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeTextField.text = college.name
        stateTextField.text = college.state
        enrollmentTextField.text = String(college.population)
        imageView.image = college.image
        webPageTextField.text = college.webPage
        imagePicker.delegate = self
        
    }
    
    func resignAllFirstResponders()
    {
        collegeTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        enrollmentTextField.resignFirstResponder()
        webPageTextField.resignFirstResponder()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage;
        }
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject)
    {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(enrollmentTextField.text!)!
        college.webPage = webPageTextField.text!
        college.image = imageView.image
        resignAllFirstResponders()
        
    }
    
    @IBAction func toWebPageOnTap(sender: AnyObject)
    {
        if(college.webPage != "")
        {
            let url = NSURL(string: college.webPage)
            let svc = SFSafariViewController(URL: url!)
            svc.delegate = self
               self.presentViewController(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func onCameraButtonTapped(sender: AnyObject)
    {
        if(UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onLibraryButtonTap(sender: AnyObject)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}
