//
//  HomeSectionCollectionReusableView.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 24/12/21.
//

import UIKit

class HomeSectionCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lableTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBg.roundPerticularSide(with: [.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 5)
    }
}
