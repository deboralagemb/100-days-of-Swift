//
//  Person.swift
//  Project10
//
//  Created by Débora Lage on 20/09/21.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
