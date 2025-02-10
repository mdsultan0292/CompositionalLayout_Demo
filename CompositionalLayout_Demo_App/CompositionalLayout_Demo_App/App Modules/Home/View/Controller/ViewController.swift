//
//  ViewController.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 22/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    private var viewModel: ViewModel?
    
    convenience init(_ vm: ViewModel) {
        self.init()
        viewModel = vm
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLayouts()
    }
}

// MARK: - Private methods.
extension ViewController{
    private func setupLayouts() {
        registerCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = makeCollectionViewLayout()
    }
    
    private func registerCell() {
        collectionView.registerNib(BannerCVCollectionViewCell.self)
        collectionView.registerNib(GridTabCollectionViewCell.self)
        collectionView.register(
            UINib(nibName: HomeSectionCollectionReusableView.className,
                bundle: nil),
            forSupplementaryViewOfKind: "header",
            withReuseIdentifier: HomeSectionCollectionReusableView.className
        )
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
                
            case 0: return self.makeListLayoutSection()
            case 1: return self.makeGridLayoutSection(false)
            default: return self.makeGridLayoutSection(true)
            }
        }
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: "background")
        return layout
    }
    
    //Grid collectionView layout.
    private func makeGridLayoutSection(_ isHeaderEnable: Bool) -> NSCollectionLayoutSection {
        // Each item will take up half of the width of the group
        // that contains it, as well as the entire available height:
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        ))
        
        // Each group will then take up the entire available
        // width, and set its height to half of that width, to
        // make each item square-shaped:
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.3)
            ),
            subitem: item,
            count: 3
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        let sectionBackground = NSCollectionLayoutDecorationItem.background(
            elementKind: "background")
        sectionBackground.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.decorationItems = [sectionBackground]
        if isHeaderEnable{
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: "header", alignment: .top)
            ]
        }
        return section
    }
    
    //List collectionView layout
    private func makeListLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
        return NSCollectionLayoutSection(group: group)
    }
}

// MARK: - CollectionView Delegate and DataSource methods.
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.dataSource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.dataSource[section].dataSource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataSource = viewModel?.dataSource[indexPath.section].dataSource
        guard let identifier = dataSource?[indexPath.row].identifier,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? BaseCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(dataSource?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeSectionCollectionReusableView.className, for: indexPath) as! HomeSectionCollectionReusableView
        reusableview.lableTitle.text = "Quick Action"
        return reusableview
    }
}

