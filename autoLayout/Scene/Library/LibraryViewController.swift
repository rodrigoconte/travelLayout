//
//  LibraryViewController.swift
//  autoLayout
//
//  Created by Rodrigo Conte on 19/01/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    // MARK: Attributes
    let travelsList: [Travel] = TravelDAO().retornaTodasAsViagens()
    
    // MARK: Outlets
    @IBOutlet weak var packageLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupCollectionViewCell()
    }
    
    private func setupCollectionViewCell() {
        let nib = UINib(nibName: "LibraryCollectionViewCell", bundle:  nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "customCollectionCell")
    }

}

// MARK: CollectionView DataSource
extension LibraryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travelsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! LibraryCollectionViewCell
        cell.collectionImage.image = UIImage(named: travelsList[indexPath.row].imgPath)
        cell.titleLabel.text = travelsList[indexPath.row].title
        cell.subTitleLabel.text = "\(travelsList[indexPath.row].days) dias"
        cell.priceLabel.text = travelsList[indexPath.row].price
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        cell.layer.cornerRadius = 10
        return cell
    }
}

// MARK: CollectionView Delegate
extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = collectionView.bounds.width/2
        return CGSize(width: widthCell - 15, height: 160)
    }
}
