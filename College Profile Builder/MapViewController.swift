//
//  ViewController.swift
//  Map Kit Hackwich
//
//  Created by RKrueger on 2/10/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var college : College!
    var location = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textField.delegate = self
        findLocation(location)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        let locationName = textField.text
        textField.resignFirstResponder()
        findLocation(locationName!)
        return true
    }
    
    func findLocation(locatonName : String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locatonName) { (placemarks, error) -> Void in
            if error != nil
            {
                print(error)
            }
            else
            {
                if (placemarks!.count > 1)
                {
                    let alert = UIAlertController(title: "Select a Location", message: nil, preferredStyle: .ActionSheet)
                    for placemark in placemarks!
                    {
                        let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else if placemarks!.count == 1
                {
                    let placemark = placemarks!.first! as CLPlacemark
                    self.displayMap(placemark)
                }
            }
        }
    }
    
    func displayMap(placemark: CLPlacemark)
    {
        textField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(1, 1)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
}

