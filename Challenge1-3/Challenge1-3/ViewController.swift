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
        
        title = "Flags challenge"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagPictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.image = UIImage(named: flagPictures[indexPath.row])
        cell.textLabel?.text = flagPictures[indexPath.row].uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.picture = flagPictures[indexPath.row]
        }
    }
}

