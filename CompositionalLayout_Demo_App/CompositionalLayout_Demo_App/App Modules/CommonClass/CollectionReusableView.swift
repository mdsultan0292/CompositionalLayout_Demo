//
//  CollectionReusableView.swift
//  CompositionalLayout_Demo_App
//
//  Created by Mohd Sultan on 24/12/21.
//

import UIKit

// MARK: - Home NSCollectionLayoutDecorationItem backround view
class SectionBackgroundDecorationView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.shadowWithRound(5,shadowRadius: 2, shadowOpacity:0.08)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


