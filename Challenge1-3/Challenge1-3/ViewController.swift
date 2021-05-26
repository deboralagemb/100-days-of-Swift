//
//  ViewController.swift
//  Challenge1-3
//
//  Created by Débora Lage on 26/05/21.
//

import UIKit

class ViewController: UITableViewController {
    var flagPictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                print(item)
                flagPictures.append(item)
            }
        }
        flagPictures.sort()
    }

}

