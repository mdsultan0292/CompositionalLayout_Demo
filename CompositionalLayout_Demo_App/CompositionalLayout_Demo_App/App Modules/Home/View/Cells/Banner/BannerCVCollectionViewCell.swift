//
//  BannerCVCollectionViewCell.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 25/12/21.
//

import UIKit

class BannerCVCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    var currentBannerIndex = 0
    var bannerData: BannerRowModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayouts()
    }

    override func configure(_ dataModel: MasterCardBaseRowModel?) {
        guard let dataModel = dataModel as? BannerRowModel else { return }
        bannerData = dataModel
        collectionView.reloadData()
        startTimer()
    }
}

extension BannerCVCollectionViewCell {
    private func setupLayouts() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(BannerCollectionViewCell.self)
        
    }
    private func startTimer() {
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScrollBanner), userInfo: nil, repeats: true)
    }
    
    @objc private func autoScrollBanner() {
        if let count = bannerData?.banners?.count {
            currentBannerIndex = currentBannerIndex == (count-1) ? 0 : currentBannerIndex+1
            collectionView.scrollToItem(at: IndexPath(item: currentBannerIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - CollectionView Delegate and DataSource methods.
extension BannerCVCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerData?.banners?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureCell(bannerData?.banners?[indexPath.item])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let centetPoint = CGPoint(x: (collectionView.contentOffset.x + collectionView.frame.midX), y: 20)
        if let indexPath = collectionView.indexPathForItem(at: centetPoint) {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - CollectionView FlowLayout Delegate methods.
extension BannerCVCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let width = frame.width*0.9
        let height: CGFloat = frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
