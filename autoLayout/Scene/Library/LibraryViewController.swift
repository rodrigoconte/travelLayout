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
    var filtered: [Travel] = []
    var searchActive: Bool = false
    
    // MARK: Outlets
    @IBOutlet weak var packageLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filtered = travelsList
        
        self.tabBarItem.title = "Library"
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
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
        if searchActive {
            return filtered.count
        }
        return travelsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! LibraryCollectionViewCell
        var tempArray: [Travel] = []
        
        if searchActive {
            tempArray = filtered;
            
        } else {
            tempArray = travelsList
        }
        
        cell.collectionImage.image = UIImage(named: tempArray[indexPath.row].imgPath)
        cell.titleLabel.text = tempArray[indexPath.row].title
        cell.subTitleLabel.text = "\(tempArray[indexPath.row].days) dias"
        cell.priceLabel.text = tempArray[indexPath.row].price
        
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


// MARK: SearchBar Delegate
extension LibraryViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = travelsList.filter({ (travel) -> Bool in
            let tmp: NSString = travel.title as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        
        if searchActive {
            resultsLabel.text = "\(filtered.count) pacotes encontrados"
        } else {
            resultsLabel.text = "\(travelsList.count) pacotes encontrados"
        }
        
        collectionView.reloadData()
    }
}
