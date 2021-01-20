//
//  LibraryCollectionViewCell.swift
//  autoLayout
//
//  Created by Rodrigo Conte on 20/01/21.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
