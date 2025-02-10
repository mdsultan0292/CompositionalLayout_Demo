//
//  UICollectionView+Extensions.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 22/12/21.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.cellReuseIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.cellReuseIdentifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.cellReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.cellReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.cellReuseIdentifier)")
        }
        
        return cell
    }
}

extension UICollectionViewCell {
    static var cellReuseIdentifier: String {
        return className
    }
}
