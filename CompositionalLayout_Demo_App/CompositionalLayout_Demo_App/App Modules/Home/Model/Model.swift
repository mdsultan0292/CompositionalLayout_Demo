//
//  Model.swift
//  CompositionalLayout_Demo_App
//
//  Created by 13401197 on 24/01/25.
//

import UIKit

struct DataModel {
    var tabName: String
}

protocol MasterCardBaseRowModel {
    var identifier: String { get set }
}

struct MasterCardDataSource {
    var dataSource: [MasterCardBaseRowModel]
}

struct BannerRowModel: MasterCardBaseRowModel {
    var identifier: String = BannerCVCollectionViewCell.cellReuseIdentifier
    var banners: [String]?
}

struct GridTabRowModel: MasterCardBaseRowModel {
    var identifier: String = GridTabCollectionViewCell.cellReuseIdentifier
    var dataModel: DataModel?
}
