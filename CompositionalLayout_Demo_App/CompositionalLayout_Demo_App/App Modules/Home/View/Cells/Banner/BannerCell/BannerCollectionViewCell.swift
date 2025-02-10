//
//  BannerCollectionViewCell.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 23/12/21.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewBanner.round(5)
    }
    
    func configureCell(_ imageName: String?) {
        if let image = imageName {
            imageViewBanner.image = UIImage(named: image)
        }
    }
}
