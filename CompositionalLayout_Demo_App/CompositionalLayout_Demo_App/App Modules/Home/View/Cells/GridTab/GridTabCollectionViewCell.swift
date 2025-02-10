//
//  GridTabCollectionViewCell.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 23/12/21.
//

import UIKit

class GridTabCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTabName: UILabel!
    @IBOutlet weak var viewBg: UIView!

    override func configure(_ dataModel: MasterCardBaseRowModel?) {
        guard let dataModel = dataModel as? GridTabRowModel else { return }
        labelTabName.text = dataModel.dataModel?.tabName
    }
}
