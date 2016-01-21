//
//  College.swift
//  College Profile Builder
//
//  Created by RKrueger on 1/21/16.
//  Copyright © 2016 RKrueger. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = "";
    var state = "";
    var population = 0;
    var image = UIImage(named: "Default")
    
    convenience init(name: String, state: String, population: Int, image: UIImage) {
        self.init()
        self.name = name
        self.state = state
        self.population = population
        self.image = image
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
