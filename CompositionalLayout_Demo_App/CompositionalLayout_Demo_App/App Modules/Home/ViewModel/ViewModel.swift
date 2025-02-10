//
//  ViewModel.swift
//  CompositionalLayout_Demo_App
//
//  Created by 13401197 on 24/01/25.
//


class ViewModel {
    var dataSource = [MasterCardDataSource] ()
    
    init() {
        addRowData()
    }
    
    private func addRowData() {
        addBannerRowData()
        grid1RowData()
        grid2RowData()
    }
    
    private func addBannerRowData() {
        let images = [ "banner_1", "banner_2", "banner_3", "banner_4"]
        let rowData = BannerRowModel(banners: images)
        dataSource.append(MasterCardDataSource(dataSource: [rowData]))
    }
    
    private func grid1RowData() {
        let gridInfo = [
            DataModel(tabName: "Grid_1_1"),
            DataModel(tabName: "Grid_1_2"),
            DataModel(tabName: "Grid_1_3"),
            DataModel(tabName: "Grid_1_4"),
            DataModel(tabName: "Grid_1_5")
        ]
        
        let rowData = gridInfo.map({GridTabRowModel(dataModel: $0)})
        dataSource.append(MasterCardDataSource(dataSource: rowData))

    }
    
    private func grid2RowData() {
        let gridInfo = [
            DataModel(tabName: "Grid_2_1"),
            DataModel(tabName: "Grid_2_2"),
            DataModel(tabName: "Grid_2_3"),
//            DataModel(tabName: "Grid_2_4"),
//            DataModel(tabName: "Grid_2_5"),
        ]
        
        let rowData = gridInfo.map({GridTabRowModel(dataModel: $0)})
        dataSource.append(MasterCardDataSource(dataSource: rowData))
    }
}
