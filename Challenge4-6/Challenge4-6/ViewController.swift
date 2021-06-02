//
//  ViewController.swift
//  Challenge4-6
//
//  Created by Débora Lage on 02/06/21.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping list"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add item", style: .plain, target: self, action: #selector(addItemToList))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareTapped))
    }
    
    @objc
    func shareTapped() {
        let list = shoppingList.joined(separator: "\n")
        let ac = UIActivityViewController(activityItems: [list], applicationActivities: [])
        present(ac, animated: true)
    }
    
    @objc
    func addItemToList() {
        let ac = UIAlertController(title: "Add item to list", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else { return }
            self?.addItemToTable(item: text)
        })
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    func addItemToTable(item: String) {
        shoppingList.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
