//
//  ViewController.swift
//  Project10
//
//  Created by Débora Lage on 08/06/21.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person",
                                                            for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        return cell
    }
}
